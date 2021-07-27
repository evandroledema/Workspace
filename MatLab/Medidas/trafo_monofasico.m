clc
clear all
disp('------------------------------------------------------------------------------------------')
disp('TRANSFORMADOR MONOFASICO')
disp('------------------------------------------------------------------------------------------')
disp('OBS:Tensao Fase-Neutro; Potencia Monofasica')
disp('------------------------------------------------------------------------------------------')
f=input('Frequencia [Hz]: ');
Vp=input('Tensao Primaria [V]: ');
Vs=input('Tensao Secundaria [V]: ');
S=input('Potencia Aparente [kVA]: ');
x=input('Reatancia [%]: ');
Po=input('Potencia do Ensaio a Vazio [W]: ');
Pcc=input('Potencia do Ensaio de Curto-Circuito [W]: ');
    disp('Coeficiente Angular:')
    w=2*pi*f
    disp('Relaçao de Transformaçao:')
    a=(Vp/Vs)
    if a>=1    
    disp('Corrente Primaria [A]:')
    Ip=((S*1000)/Vp)
    disp('Corrente Secundaria [A]:')
    Is=a*Ip
    disp('Reatancia Equivalente [Ohms]:')
    Xeq=((Vp^2)*x)./(S*1000*100)
    disp('Reatancia do Primario [Ohms]:')
    Xp=(Xeq/2)     
    disp('Indutancia do Primario [mH]:')
    XpmH=((Xp*1000)./w)
    disp('Reatancia do Secundario [Ohms]:')
    Xs=(Xp/(a^2))
    disp('Indutancia do Secundario [mH]:')
    XsmH=((Xs*1000)./w)
    disp('Resistencia Equivalente [Ohms]:')
    Req=(Pcc./(Ip^2))         
    disp('Resistencia do Primario [Ohms]:')
    Rp=(Req./2)
    disp('Resistencia do Secundario [Ohms]:')
    Rs=(Rp)./(a^2)          
    disp('Resistencia de Magnetizaçao [Ohms]:')
    Rmag=((Vp^2)/Po)
    disp('Tensao de Curto-Circuito [V]:')
    Zp=sqrt((Rp^2)+(Xp^2));
    Vcc= ((Zp*Ip).*2)
else a<1
    disp('Corrente Primaria [A]:')
    Ip=((S*1000)./Vp)
    disp('Corrente Secundaria [A]:')
    Is=(a*Ip)   
    disp('Reatancia Equivalente [Ohms]:')
    Xeq=((Vs^2)*x)./(S*1000*100)              
    disp('Reatancia do Primario [Ohms]:')
    Xp=((Xeq)/2)*(a^2)     
    disp('Indutancia do Primario [mH]:')
    XpmH=((Xp*1000)./w)
    disp('Reatancia do Secundario [Ohms]:')
    Xs=(Xeq./2)
    disp('Indutancia do Secundario [mH]:')
    XsmH=((Xs*1000)./w)
    disp('Resistencia Equivalente [Ohms]:')
    Req=(Pcc./(Is^2))         
    disp('Resistencia do Primario [Ohms]:')
    Rp=(Req./2)*(a^2)
    disp('Resistencia do Secundario [Ohms]:')
    Rs=(Req./2)          
    disp('Resistencia de Magnetizaçao [Ohms]:')
    Rmag=((Vp^2)/Po)
    disp('Tensao de Curto-Circuito [V]:')
    Zs=sqrt((Rs^2)+(Xs^2));
    Vcc=((Zs*Is).*2)
end
