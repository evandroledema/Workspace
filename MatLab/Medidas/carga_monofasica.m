clc
clear all
disp('--------------------------------------------------------------')
disp('CARGA MONOFASICA')
disp('--------------------------------------------------------------')
    f=input('Frequencia [Hz]: ');
    n=input('Rendimento do Transformador [%]: ');   
    S=input('Potencia Aparente [kVA]: ');
    U=input('Tensao na Carga [V]: ');
    fp=input('Fator de Potencia (+:Indutivo e -:Capacitivo): ');
    if fp>=0
        disp('Coeficiente Angular:')
        w=2*pi*f
        disp('Modulo da Corrente de Linha [A]:')
        IL=(S*1000*n)./(U*100)
        disp('Angulo da Corrente de Linha [Graus]:')
        r=acos(fp);       
        ILang=-r/pi*180 
        disp('Potencia Ativa [kW]:')
        P=(S*n*fp)./100
        disp('Potencia Reativa [kVAr]:')
        Q=sqrt(((S*n/100)^2)-(P^2))
        disp('Modulo da Impedancia [Ohms]:')
        Zmod=(U/IL)
        disp('Angulo da Impedancia [Graus]:')
        Zang=ILang             
        disp('Impedancia na Forma Retangular:')
        x=Zmod*cos(r);
        y=Zmod*sin(r);
        Zret=complex(x,y)
        disp('Resistencia [Ohms]:')
        R=x
        disp('Indutancia [mH]:')
        L=(y/w).*1000
    else fp<=0
        disp('Coeficiente Angular:')
        w=2*pi*f
        disp('Modulo da Corrente de Linha [A]:')
        IL=(S*1000*n)./(U*100)
        disp('Angulo da Corrente de Linha [Graus]:')
        r=acos(fp);       
        ILang=r/pi*180 
        disp('Potencia Ativa [kW]:')
        P=(S*n*fp)./100
        disp('Potencia Reativa [kVAr]:')
        Q=sqrt(((S*n/100)^2)-(P^2))
        disp('Modulo da Impedancia [Ohms]:')
        Zmod=(U/IL)
        disp('Angulo da Impedancia [Graus]:')
        Zang=ILang             
        disp('Impedancia na Forma Retangular:')
        x=-Zmod*cos(r);
        y=Zmod*sin(-r);
        Zret=complex(x,y)
        disp('Resistencia [Ohms]:')
        R=x
        disp('Capacitancia [uF]:')
        C=(1/(-y*w))*1000000
    end    
    
    
    
    
    
    
    
    
    
