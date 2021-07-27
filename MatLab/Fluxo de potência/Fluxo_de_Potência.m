%--------------------------------------------------------------/
%Script Fluxo de Pot�ncia utilizando o m�todo Newton-Raphson
%An�lise 2
%Evandro Fernandes Ledema - RGA:201411302002
% Este programa calcula o fluxo de pot�ncia utilizando o m�todo
%de Newton-Raphson, Jacobiana, H, M, N e L.
%--------------------------------------------------------------/
%Limpa a tela
clc;   
%Limpa as poss�veis vari�veis
clear all;  

%Tens�o de refer�ncia V1
V(1)=1; 
%�ngulo de refer�ncia O1
Theta(1)=0;

%Tens�o Barra 2
V(2)=0.92;
%Inc�gnita Barra 2 - Chute inicial O2
Theta(2)=0;

%Inc�gnita Barra 3 - Chute inicial V3 e O3
V(3)=1;
Theta(3)=0;

%Montagem da matriz de admit�ncia Segundo Modelo
Y(1,1) = 0.0000-3.4708i;
Y(1,2) = 0.0000+1.7007i;
Y(1,3) = 0.0000+1.7007i;
Y(2,1) = 0.0000+1.7007i;
Y(2,2) = 0.2212-4.8853i;
Y(2,3) = -0.2212+3.3186i;
Y(3,1) = 0.0000+1.7007i;
Y(3,2) = -0.2212+3.3186i;
Y(3,3) = 0.2212-4.8853i;

%Matriz de Admit�ncia - Modelo Y = G +jB
G = real(Y);
B = imag(Y);

%Itera��o - Vari�vel para contar # da itera��o
i=0;

%Toler�ncia: Tol.
Tol = 1.0E-3;

%loop - while
while(1)
    %Somente o Somat�rio - Utiliza-se For
    P(2) = 0;
    P(3) = 0;
    Q(2) = 0;
    Q(3) = 0;
    
    %Equa��es Matriz Jacobiana: dimens�o 2NPQ + NPV = 2.(1)+1 = 3.
    %A dimens�o da matriz ser� 3x3, 3 vari�veis de estado.
    %O index m ir� de 1 at� a quantia de barras, nota��o KM.
    for m = 1:3,                
        Theta2x = Theta(2)-Theta(m);
        Theta3x = Theta(3)-Theta(m);
        P(2) = P(2) + V(m)*(G(2,m)*cos(Theta2x)+B(2,m)*sin(Theta2x));
        P(3) = P(3) + V(m)*(G(3,m)*cos(Theta3x)+B(3,m)*sin(Theta3x));
        Q(2) = Q(2) + V(m)*(G(2,m)*sin(Theta2x)-B(2,m)*cos(Theta2x));
        Q(3) = Q(3) + V(m)*(G(3,m)*sin(Theta3x)-B(3,m)*cos(Theta3x));
        % � necess�rio colocar P(2) e Q(2) novamente pois n�o possui comando de
        % acr�scimo como c++: ++, --,+=, -=, *=, etc.
        
    end
    
    %Agora � preciso juntar o somat�rio a Parte que estava fora na f�rmula:
    P(2) = V(2)*P(2);
    P(3) = V(3)*P(3);
    Q(2) = V(2)*Q(2);
    Q(3) = V(3)*Q(3);
    
    %Res�duos: g = [3x1]:
    g(1,1) = -0.0798-P(2);
    g(2,1) = -0.2004-P(3);
    g(3,1) = -0.1507-Q(3);
    
    %Retorna o valor m�ximo absoluto do vetor g:
    erroMax = max(abs(g));

    %Teste de Converg�ncia
    if (erroMax<Tol),
        fprintf('> Fluxo de pot�ncia bem sucedido. \n\n')
        %Exibir resultado:
        fprintf('> Theta(2): \n');
        disp(180*Theta(2)/pi);
        fprintf('> Theta(3): \n');
        disp(180*Theta(3)/pi);
        fprintf('> V(3): \n');
        disp(V(3));
        break
    else
        %Jacobiana Reduzida
        Theta23 = Theta(2)-Theta(3);
        H22 = -B(2,2)*V(2)*V(2)-Q(2);
        H23 = V(2)*V(3)*(G(2,3)*sin(Theta23)-B(2,3)*cos(Theta23));
        H32 = -V(2)*V(3)*(G(2,3)*sin(Theta23)+B(2,3)*cos(Theta23));
        H33 = -B(3,3)*V(3)*V(3)-Q(3);
        N23 = V(2)*(G(2,3)*cos(Theta23)+B(2,3)*sin(Theta23));
        N33 = (P(3)+G(3,3)*V(3)*V(3))/V(3);
        M32 = -V(2)*V(3)*(G(2,3)*cos(Theta23)-B(2,3)*sin(Theta23));
        M33 = -G(3,3)*V(3)*V(3)+P(3);
        L33 = (Q(3)-B(3,3)*V(3)*V(3))/V(3);
        %Montagem da Jacobiana Reduzida
        J = [H22 H23 N23; H32 H33 N33; M32 M33 L33];
        
        %Solu��o do Sistema Linear
        %Inc�gnitas do sistema da forma g = J . X
        X = J\g;
        
        %Atualizar as inc�gnitas, vari�veis de estado
        Theta(2) = Theta(2)+X(1);
        Theta(3) = Theta(3)+X(2);
        V(3) = V(3)+X(3);
        
        %counter
        i = i+1;
        if i > 15,
            fprintf('\n> N�mero m�ximo de itera��es permitido excedido.\n')
            fprintf('> Execu��o interrompida.\n\n')
            return
        end
    end
end