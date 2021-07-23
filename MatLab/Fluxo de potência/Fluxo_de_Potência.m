%--------------------------------------------------------------/
%Script Fluxo de Potência utilizando o método Newton-Raphson
%Análise 2
%Evandro Fernandes Ledema - RGA:201411302002
% Este programa calcula o fluxo de potência utilizando o método
%de Newton-Raphson, Jacobiana, H, M, N e L.
%--------------------------------------------------------------/
%Limpa a tela
clc;   
%Limpa as possíveis variáveis
clear all;  

%Tensão de referência V1
V(1)=1; 
%Ângulo de referência O1
Theta(1)=0;

%Tensão Barra 2
V(2)=0.92;
%Incógnita Barra 2 - Chute inicial O2
Theta(2)=0;

%Incógnita Barra 3 - Chute inicial V3 e O3
V(3)=1;
Theta(3)=0;

%Montagem da matriz de admitância Segundo Modelo
Y(1,1) = 0.0000-3.4708i;
Y(1,2) = 0.0000+1.7007i;
Y(1,3) = 0.0000+1.7007i;
Y(2,1) = 0.0000+1.7007i;
Y(2,2) = 0.2212-4.8853i;
Y(2,3) = -0.2212+3.3186i;
Y(3,1) = 0.0000+1.7007i;
Y(3,2) = -0.2212+3.3186i;
Y(3,3) = 0.2212-4.8853i;

%Matriz de Admitância - Modelo Y = G +jB
G = real(Y);
B = imag(Y);

%Iteração - Variável para contar # da iteração
i=0;

%Tolerância: Tol.
Tol = 1.0E-3;

%loop - while
while(1)
    %Somente o Somatório - Utiliza-se For
    P(2) = 0;
    P(3) = 0;
    Q(2) = 0;
    Q(3) = 0;
    
    %Equações Matriz Jacobiana: dimensão 2NPQ + NPV = 2.(1)+1 = 3.
    %A dimensão da matriz será 3x3, 3 variáveis de estado.
    %O index m irá de 1 até a quantia de barras, notação KM.
    for m = 1:3,                
        Theta2x = Theta(2)-Theta(m);
        Theta3x = Theta(3)-Theta(m);
        P(2) = P(2) + V(m)*(G(2,m)*cos(Theta2x)+B(2,m)*sin(Theta2x));
        P(3) = P(3) + V(m)*(G(3,m)*cos(Theta3x)+B(3,m)*sin(Theta3x));
        Q(2) = Q(2) + V(m)*(G(2,m)*sin(Theta2x)-B(2,m)*cos(Theta2x));
        Q(3) = Q(3) + V(m)*(G(3,m)*sin(Theta3x)-B(3,m)*cos(Theta3x));
        % é necessário colocar P(2) e Q(2) novamente pois não possui comando de
        % acréscimo como c++: ++, --,+=, -=, *=, etc.
        
    end
    
    %Agora é preciso juntar o somatório a Parte que estava fora na fórmula:
    P(2) = V(2)*P(2);
    P(3) = V(3)*P(3);
    Q(2) = V(2)*Q(2);
    Q(3) = V(3)*Q(3);
    
    %Resíduos: g = [3x1]:
    g(1,1) = -0.0798-P(2);
    g(2,1) = -0.2004-P(3);
    g(3,1) = -0.1507-Q(3);
    
    %Retorna o valor máximo absoluto do vetor g:
    erroMax = max(abs(g));

    %Teste de Convergência
    if (erroMax<Tol),
        fprintf('> Fluxo de potência bem sucedido. \n\n')
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
        
        %Solução do Sistema Linear
        %Incógnitas do sistema da forma g = J . X
        X = J\g;
        
        %Atualizar as incógnitas, variáveis de estado
        Theta(2) = Theta(2)+X(1);
        Theta(3) = Theta(3)+X(2);
        V(3) = V(3)+X(3);
        
        %counter
        i = i+1;
        if i > 15,
            fprintf('\n> Número máximo de iterações permitido excedido.\n')
            fprintf('> Execução interrompida.\n\n')
            return
        end
    end
end