clc
clear all
disp('|------------------------------------|')
disp('|---------BANCO--DE------------------|')
disp('|---------CAPACITORES------------------|')
disp('|------------------------------------|')
disp('|---CORRECAO-DE-FATOR-DE-POTENCIA----|')
disp('|------------------------------------|')
disp('|---ACADEMICO:-KONSTANTIN-HUDEPOHL---|')
disp('|------------------------------------|')

    S=input('Potencia Aparente da Carga [kVA]:');
    fpa=input('Fator de Potencia da Carga: ');
    fpd=input('Fator de Potencia Desejado: ');
    V=input('Tensao na Carga (Fase-Fase) (Rms) [V]:');
    f=input('Frequencia da Rede [Hz]:');

disp('Angulo do Fator de Potencia Atual: [º]')
    a1=acos(fpa)*180/pi
    
disp('Angulo do Fator de Potencia Desejado: [º]')
    a2=acos(fpd)*180/pi

disp('Potencia Ativa da Carga: [kW]')
    P=S*cos(a1*pi/180)
    
disp('Potencia Reativa da Carga: [kVAr]')
    Q=S*sin(a1*pi/180)
    
disp('|------------------------------------|')
disp('|---------POTENCIA-DO----------------|')
disp('|---------BANCO----------------------|')
disp('|------------------------------------|')

disp('Potencia do Banco: [kVAr]')
    Qb=P*(tan(a1*pi/180)-tan(a2*pi/180))
    
disp('|------------------------------------|')
disp('|---------ENTRE-COM-A-POTENCIA-------|')
disp('|---------COMERCIAL-DO-BANCO---------|')
disp('|------------------------------------|')
    
Qc=input('Potencia Comercial do Banco [kVAr]:');
lig=input('Banco em Delta (0) ou Estrela (1):');

    if lig==0
        disp('|------------------------------------|')
        disp('|---------VALORES-DO-----------------|')
        disp('|---------BANCO-(DELTA)--------------|')
        disp('|------------------------------------|')

        disp('Reatancia do Banco: [Ohms]')
            Xc=((V^2)/((Qc*1000)/3))
       
        
        disp('Capacitancia do Banco: [uF]')
            Cd=(1/(2*pi*f*Xc))*1000000
       
    end    
    
    if lig==1 

        disp('|------------------------------------|')
        disp('|---------VALORES-DO-----------------|')
        disp('|---------BANCO-(ESTRELA)------------|')
        disp('|------------------------------------|')

        disp('Reatancia do Banco: [Ohms]')
            Xc=(((V/sqrt(3))^2)/((Qc*1000)/3))
            
        disp('Capacitancia do Banco: [uF]')
            Cy=(1/(2*pi*f*Xc))*1000000
                   
    end
