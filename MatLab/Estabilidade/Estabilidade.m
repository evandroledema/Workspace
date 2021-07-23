%             Avaliação 4, Análise 2. 
% Evandro Fernandes Ledema, RGA: 201411302002.
%===================================================
% Estabilidade de Sistemas Elétricos
%===================================================
% Este programa calcula: EP, XtA, XtF, XtD, VTH, ZTH
%===================================================

%limpa o console
clc;

%zera as variáveis
clearvars;

%Bases do lado da LT
Vbase = 345;           % kV Tensão base
Sbase = 100;           % MVA Potência base
Zbase = Vbase^2/Sbase; % Ohm Impedância base

%Linha de Transmissão
L = 100;               % Comprimento da LT em km
XL = 0.211;            % XL (ohm/km) - Reatância da LT em Ohm/km
XL = L*XL;             % Valor de XL em Ohm
XL = XL/Zbase;         % Valor de XL em pu

%Transformador de Potência
Xtr = 0.28;            % (pu) - Reatância do Transformador
SbT = 1500;            % Potência base do fabricante
Xtr = Xtr*Sbase/SbT;   % Reatância do Transformador após mudança de base

%Gerador Síncrono
SbG = 1500;            % Potência base do fabricante do Gerador
Xd = 0.37;             % (pu) - Reatância transitória de eixo direto
Xd = Xd*Sbase/SbG;     % Reatância do transitória de eixo direto após mudança de base
Pm = 1474;             % Potência mecânica em MW
Pm = Pm/Sbase;         % Potência mecânica em pu
Pe = Pm;               % Potência elétrica = Potência mecânica devido sincronismo
                       % Implica W = cte e f = cte = 60Hz
Hgen = 4.7;            % Constante de Inércia do gerador
H = Hgen*SbG/Sbase;    % Mudança de base de H
w0 = 2*pi*60;          % Velocidade angular síncrona

%Dados Adicionais
EB = 1;                % Tensão na barra infinita
V1 = 1.05;             % Tensão na barra 1
m = 0.71;              % Porcentagem da linha em curto-circuito

%===================================================
% Cálculo de EP e XtA antes da falta
%===================================================
XtA = Xd + Xtr + XL/2;

%Ângulo entre a barra 1  e a barra B
Teta1B = asind(Pe*(XL/2)/(V1*EB));

%Tensão V1 na forma cartesiana
V1 = V1*(cosd(Teta1B) + 1i*sind(Teta1B));

%Cálculo da corrente
I = (V1 - EB)/(1i*XL/2);

%Tensão interna do gerador
EP = V1 + 1i*(Xd + Xtr)*I;

%===================================================
%   Cálculo de XtF durante a falta ao 70% (m) de uma
% das linhas de transmissão.
%===================================================
XTH = XL*m/(m+1);
XtF = Xd + Xtr + XTH;
VTH = EB*m/(1 + m);

%===================================================
% Cálculo de EPf durante a falta
%===================================================

%Ângulo entre a barra 1  e a barra B
Teta1Bf = asind(Pe*(XTH)/(V1*VTH));

%Tensão V1f na forma cartesiana
V1f = V1*(cosd(Teta1Bf) + 1i*sind(Teta1Bf));

%Cálculo da corrente
If = (V1f - VTH)/(1i*XTH);

%Tensão interna do gerador
EPf = V1f + 1i*(Xd + Xtr)*If;

%===================================================
% Cálculo de EPd depois da falta
%===================================================

%Ângulo entre a barra 1  e a barra B
Teta1Bd = asind(Pe*(XL)/(V1*EB));

%Tensão V1d na forma cartesiana
V1d = V1*(cosd(Teta1Bd) + 1i*sind(Teta1Bd));

%Cálculo da corrente
Id = (V1d - EB)/(1i*XL);

%Tensão interna do gerador
EPd = V1d + 1i*(Xd + Xtr)*Id;

%===================================================
%   Cálculo de XtD durante a falta, com uma linha
% removida.
%===================================================
XtD = Xd + Xtr + XL;


fprintf('Antes da Falta: \n');
fprintf('Forma cartesiana ');
fprintf('EP: ');
disp(EP);
fprintf('Forma fasorial EP: ');
disp(abs(EP));
fprintf('Graus: ');
disp(atand(imag(EP)/real(EP)));
fprintf('XtA: ');
disp(XtA);


%===================================================
%   Durante a falta
%===================================================
fprintf('===================================================\n');
fprintf('Durante a Falta: \n');
fprintf('Forma cartesiana ');
fprintf('EPf: ');
disp(EPf);
fprintf('Forma fasorial EPf: ');
disp(abs(EPf));
fprintf('Graus: ');
disp(atand(imag(EPf)/real(EPf)));
fprintf('XtF: ');
disp(XtF);
fprintf('ZTH: ');
disp(XTH);
fprintf('VTH: ');
disp(VTH);

%===================================================
%   Depois da falta
%===================================================
fprintf('===================================================\n');
fprintf('Depois da Falta: \n');
fprintf('Forma cartesiana ');
fprintf('EPd: ');
disp(EPd);
fprintf('Forma fasorial EPd: ');
disp(abs(EPd));
fprintf('Graus: ');
disp(atand(imag(EPd)/real(EPd)));
fprintf('XtD: ');
disp(XtD);
