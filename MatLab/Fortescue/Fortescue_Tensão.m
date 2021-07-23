%--------------------------------------------------------------/
%Script Fortescue - sequ�ncia de fase
%An�lise 2
%Evandro Fernandes Ledema - RGA:201411302002
% Este programa calcula as tes�es atrav�s das sequ�ncias de fase.
%maio de 2021, eng. el�trica, UFMT.
%--------------------------------------------------------------/

%limpar tela
clc;

%Tens�s
Va0=200;
Va1=210*(cosd(-30)+1i*sind(-30));
Va2=150*(cosd(190)+1i*sind(190));

%Matriz V012
V012=[Va0;Va1;Va2];

%operador a
a=cosd(120)+1i*sind(120);

%Matriz T 
T=[1  1      1;
   1  a^2    a; 
   1  a      a^2];

%Mudan�a de sequ�ncia para fase
Vabc=T*V012;

%Tens�es fases a,b e c:
fprintf('Va\nVb\nVc:\n');
disp(Vabc);