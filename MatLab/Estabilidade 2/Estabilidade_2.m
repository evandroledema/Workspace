%             Avaliação 5, Análise 2. 
% Evandro Fernandes Ledema, RGA: 201411302002.
%===================================================
% Estabilidade de Sistemas Elétricos
%===================================================
% Este programa calcula: EP, XtA, XtF, XtD, VTH, ZTH
%===================================================

%% Cabeçalho
%limpa o console
clc;

%zera as variáveis
clearvars;

 %prealocando os vetores para fins de velocidade
W = zeros(1,99998);
I = zeros(1,99998);
V = zeros(1,99998);
Pe = zeros(1,99998);
t = zeros(1,99998);
de = zeros(1,99998);
de_g = zeros(1,99998);

%% ===================================================
% Dados da Rede Elétrica
%=====================================================
EB = 1;                                                                         %Tensão no barramento infinito          
W0 = 2*pi*60;                                                             %Velocidade angular síncrona
Pm  = 1474/100;                                                           %Potência mecânica - Vide Tabela
H = 70.5;                                                                      %Inércia em pu - vide P4.
D = 180;                                                                           %Constante de amortecimento em pu (zero = sem amortecimento)
Xd = 0.024666666666667;                                          %Reatância do gerador - Format Long - vide P4
EP = 1.246389466964477 + 0.769384036967024i;    %Tensão interna do gerador - vide P4
VP = abs(EP);                                                              %Módulo da tensão interna
XtA = 0.052197017433312;                                        %Vide P4
XtF = 0.050693819545012;                                        %Vide P4
XtD = 0.061060701533291;                                        %Vide P4
VTH = 0.415204678362573;                                       %Tensão de Thevenin - vide P4

%% ===================================================
% Dados da Simulação
%===================================================
Dt = 1.0D-4;                                     %1*10^-4 - Passo de integração
TE = 1;                                             %Tempo do evento (s)
t(1) = 0;                                            %Tempo de início da simulção
TEF = 300.0D-3;                               %Tempo de eliminação da falta
TFim = 10;                                       %Tempo final da simulação
F1 = 0;
F2 = 0;


%% ===================================================
% Método Euler yi = y(i - 1) + Dt.Fi - 1
% dy/dt = F
% y = [delta W]'  F = [F1 F2]'
% F1 = w - w0     F2 = (w0/2H)*(Pm - Pe - D*DW)
%===================================================
%Valores Iniciais
W(1) = W0;
de(1) = atan(imag(EP)/real(EP));
Pe(1) = Pm;
I(1) = (EP-EB)/(1i*XtA);
V(1) = EP-1i*Xd*I(1);
Dr = 0;
de_Dr = (de(1)-Dr)*180/pi;



%% Numero de pontos até antes do evento
PAE = floor((TE-t(1))/Dt); 
for i = 2:PAE,  %%primeiro momento, antes do evento
    t(i) = t(i-1)+Dt;
    F1 = (W0/(2*H))*(Pm-Pe(i-1)-D*(W(i-1)-W0)/W0);
    F2 = W(i-1)-W0;
    W(i) = W(i-1) + Dt*F1;
    de(i) = de(i-1) + Dt*F2;
    de_g(i) = de(i)*180/pi;
    EP = VP*(cos(de(i))+1i*sin(de(i)));
    I(i) = (EP-EB)/(1i*XtA);
    V(i) = EP-1i*Xd*I(i);
    Pe(i) = real(EP*conj(I(i)));
end    

%% Numero de pontos durante o evento
PDE = floor(TEF/Dt);
for i = PAE+1:PAE+PDE, %%primeiro momento, durante o evento
    t(i) = t(i-1)+Dt;
    F1 = (W0/(2*H))*(Pm-Pe(i-1)-D*(W(i-1)-W0)/W0);
    F2 = W(i-1)-W0;
    W(i) = W(i-1) + Dt*F1;
    de(i) = de(i-1) + Dt*F2;
    de_g(i) = de(i)*180/pi;
    EP = VP*(cos(de(i))+1i*sin(de(i)));
    I(i) = (EP-VTH)/(1i*XtF);
    V(i) = EP-1i*Xd*I(i);
    Pe(i) = real(EP*conj(I(i)));    
end

%% Numero de pontos depois do evento
PDV = floor((TFim-(TE+TEF))/Dt);
for i = PAE+PDE+1:PAE+PDE+PDV,
    t(i) = t(i-1)+Dt;
    F1 = (W0/(2*H))*(Pm-Pe(i-1)-D*(W(i-1)-W0)/W0);
    F2 = W(i-1)-W0;
    W(i) = W(i-1) + Dt*F1;
    de(i) = de(i-1) + Dt*F2;
    de_g(i) = de(i)*180/pi;
    EP = VP*(cos(de(i))+1i*sin(de(i)));
    I(i) = (EP-EB)/(1i*XtD);
    V(i) = EP-1i*Xd*I(i);
    Pe(i) = real(EP*conj(I(i)));       
end    


%% Visualizar 
figure(1);
plot(t, de_g);
hold off;
grid on;