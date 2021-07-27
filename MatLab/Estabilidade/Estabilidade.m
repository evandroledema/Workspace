%             Avalia��o 4, An�lise 2. 
% Evandro Fernandes Ledema, RGA: 201411302002.
%===================================================
% Estabilidade de Sistemas El�tricos
%===================================================
% Este programa calcula: EP, XtA, XtF, XtD, VTH, ZTH
%===================================================

%limpa o console
clc;

%zera as vari�veis
clearvars;

%Bases do lado da LT
Vbase = 345;           % kV Tens�o base
Sbase = 100;           % MVA Pot�ncia base
Zbase = Vbase^2/Sbase; % Ohm Imped�ncia base

%Linha de Transmiss�o
L = 100;               % Comprimento da LT em km
XL = 0.211;            % XL (ohm/km) - Reat�ncia da LT em Ohm/km
XL = L*XL;             % Valor de XL em Ohm
XL = XL/Zbase;         % Valor de XL em pu

%Transformador de Pot�ncia
Xtr = 0.28;            % (pu) - Reat�ncia do Transformador
SbT = 1500;            % Pot�ncia base do fabricante
Xtr = Xtr*Sbase/SbT;   % Reat�ncia do Transformador ap�s mudan�a de base

%Gerador S�ncrono
SbG = 1500;            % Pot�ncia base do fabricante do Gerador
Xd = 0.37;             % (pu) - Reat�ncia transit�ria de eixo direto
Xd = Xd*Sbase/SbG;     % Reat�ncia do transit�ria de eixo direto ap�s mudan�a de base
Pm = 1474;             % Pot�ncia mec�nica em MW
Pm = Pm/Sbase;         % Pot�ncia mec�nica em pu
Pe = Pm;               % Pot�ncia el�trica = Pot�ncia mec�nica devido sincronismo
                       % Implica W = cte e f = cte = 60Hz
Hgen = 4.7;            % Constante de In�rcia do gerador
H = Hgen*SbG/Sbase;    % Mudan�a de base de H
w0 = 2*pi*60;          % Velocidade angular s�ncrona

%Dados Adicionais
EB = 1;                % Tens�o na barra infinita
V1 = 1.05;             % Tens�o na barra 1
m = 0.71;              % Porcentagem da linha em curto-circuito

%===================================================
% C�lculo de EP e XtA antes da falta
%===================================================
XtA = Xd + Xtr + XL/2;

%�ngulo entre a barra 1  e a barra B
Teta1B = asind(Pe*(XL/2)/(V1*EB));

%Tens�o V1 na forma cartesiana
V1 = V1*(cosd(Teta1B) + 1i*sind(Teta1B));

%C�lculo da corrente
I = (V1 - EB)/(1i*XL/2);

%Tens�o interna do gerador
EP = V1 + 1i*(Xd + Xtr)*I;

%===================================================
%   C�lculo de XtF durante a falta ao 70% (m) de uma
% das linhas de transmiss�o.
%===================================================
XTH = XL*m/(m+1);
XtF = Xd + Xtr + XTH;
VTH = EB*m/(1 + m);

%===================================================
% C�lculo de EPf durante a falta
%===================================================

%�ngulo entre a barra 1  e a barra B
Teta1Bf = asind(Pe*(XTH)/(V1*VTH));

%Tens�o V1f na forma cartesiana
V1f = V1*(cosd(Teta1Bf) + 1i*sind(Teta1Bf));

%C�lculo da corrente
If = (V1f - VTH)/(1i*XTH);

%Tens�o interna do gerador
EPf = V1f + 1i*(Xd + Xtr)*If;

%===================================================
% C�lculo de EPd depois da falta
%===================================================

%�ngulo entre a barra 1  e a barra B
Teta1Bd = asind(Pe*(XL)/(V1*EB));

%Tens�o V1d na forma cartesiana
V1d = V1*(cosd(Teta1Bd) + 1i*sind(Teta1Bd));

%C�lculo da corrente
Id = (V1d - EB)/(1i*XL);

%Tens�o interna do gerador
EPd = V1d + 1i*(Xd + Xtr)*Id;

%===================================================
%   C�lculo de XtD durante a falta, com uma linha
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
