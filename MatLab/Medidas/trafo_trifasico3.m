clc
clear all
disp('------------------------------------------------------------------------------------------')
disp('TRANSFORMADOR TRIFASICO TRES ENROLAMENTOS')
disp('------------------------------------------------------------------------------------------')
disp('OBS:Ligaçao 1º=Y, 2º=Y e 3º=D; Tensoes Fase-Fase, Potencias Trifasicas')
disp('------------------------------------------------------------------------------------------')
f=input('Frequencia [Hz]: ');
Sp=input('Potencia do Primario [MVA]: ');
Up=input('Tensao do Primario [kV]: ');
Ss=input('Potencia do Secundario [MVA]: ');
Us=input('Tensao do Secundario [kV]: ');
St=input('Potencia do Terciario [MVA]: ');
Ut=input('Tensao do Terciario [kV]: ');
zps=input('Reatancia Primario-Secundario [%]: ');
zpt=input('Reatancia Primario-Terciario [%]: ');
zst=input('Reatancia Secundario-Terciario [%]: ');
    disp('Coeficiente Angular:')
    w=2*pi*f
    disp('Corrente de Linha Primaria [A]:')
    ILp=(Sp*1e6)./(Up*1e3*sqrt(3))
    disp('Corrente de Fase Primaria [A]:')
    IFp=ILp
    disp('Corrente de Linha Secundaria [A]:')
    ILs=(Ss*1e6)./(Us*1e3*sqrt(3))
    disp('Corrente de Fase Secundaria [A]:')
    IFs=ILs
    disp('Corrente de Linha Terciaria [A]:')
    ILt=(St*1e6)./(Ut*1e3*sqrt(3))
    disp('Corrente de Fase Terciaria [A]:')
    IFt=ILt/sqrt(3)
    disp('Reatancia do Primario [Ohms]:')
    zp=((zps+zpt-zst).*0.5)./100
    Zp=zp*((Up^2)./Sp)
    disp('Indutancia do Primario [mH]:')
    ZpmH=(Zp/w).*1000
    disp('Reatancia do Secundario [Ohms]:')
    zs=((zps+zst-zpt).*0.5)./100
    Zs=zs*((Us^2)./Sp)
    disp('Indutancia do Secundario [mH]:')
    ZsmH=(Zs/w).*1000
    disp('Reatancia do Terciario [Ohms]:')
    zt=((zpt+zst-zps).*0.5)./100
    Zt=zt*((Ut^2)./Sp)
    disp('Indutancia do Terciario [mH}:')
    ZtmH=(Zt/w).*1000
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    