%--------------------------------------------------------------/
%Script Fortescue - sequência de fase
%Análise 2
%Evandro Fernandes Ledema - RGA:201411302002
% Este programa calcula as correntes de sequência de fase.
%maio de 2021, eng. elétrica, UFMT.
%--------------------------------------------------------------/

%limpar tela
clc;

%Correntes
Ia=10+4i;
Ib=11-9i; 
Ic=-15+9i;

%Matriz Iabc
Iabc=[Ia;Ib;Ic];

%operador a
a=cosd(120)+1i*sind(120);

%Matriz T 
T=[1  1      1;
   1  a^2    a; 
   1  a      a^2];

%Matriz T Inversa
invT = (1/3)*[1  1   1;
              1  a   a^2;
              1  a^2 a];
          
%Mudança de fase para o domínio da sequência
Ia012=invT*Iabc;

%Encontrando Ib012 e Ic012
Ib012=[1*Ia012(1,1); a^2*Ia012(2,1); a*Ia012(3,1)];
Ic012=[1*Ia012(1,1); a*Ia012(2,1); a^2*Ia012(3,1)];

%Correntes nas sequências:
fprintf('Ia1\nIa2\nIa0:\n');
disp(Ia012);
fprintf('\nIb1\nIb2\nIb0:\n');
disp(Ib012);
fprintf('\nIc1\nIc2\nIc0:\n');
disp(Ic012);