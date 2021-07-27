clc
clear
disp('|------------------------------------|')
disp('|----------FILTRO-SINTONIZADO------------|')
disp('|----------E-BANCO DE CAPACITORES--------|')
disp('|----------BAIXA-TENSAO--------------|')
disp('|------------------------------------|')
disp('|---ACADEMICO:-THAIS KEMPNER---------|')
disp('|------------------------------------|')

h=input('Ordem Harmonica Presente [h]:');
V=input('Tensao na carga (Fase-Fase) [V]:');
Q=input('Potencia Capacitiva Comercial [kVAr]:');
f=input('Frequencia da Rede [Hz]:');
fq=input('Fator de Qualidade [30 a 60]:');
lig=input('Ligacao em Delta (0) ou Estrela (1):');

if lig==0
    
    Xf=((V^2)/Q*1000/3);
    
    Xc=((h^2)*Xf)/((h^2)-1);
    
    Xcr=Xf;
    
    Xl=(Xcr/(h^2))
    
       
    disp('|--------------------------------|')
    disp('|-------VALORES------------------|')
    disp('|--------------------------------|')
    disp('|-------DO-FILTRO----------------|')
    disp('|--------------------------------|')
    
    disp('Capacitancia [uF]');
    C=(1/(2*pi*f*Xcr))*1000000000000
    
    disp('Indutancia [mH]');
    L=(Xl/(2*pi*f))/1000
    
    disp('Resistencia [Ohms]');
    R=sqrt((L/1000)/(C/1000000))/fq
    
end
    
if lig==1
        
    Xf=((V^2)/Q*1000);
    
    Xc=((h^2)*Xf)/((h^2)-1);
    
    Xcr=Xf;
    
    Xl=(Xcr/(h^2))
    
       
    disp('|--------------------------------|')
    disp('|-------VALORES------------------|')
    disp('|--------------------------------|')
    disp('|-------DO-FILTRO----------------|')
    disp('|--------------------------------|')
    
    disp('Capacitancia [uF]');
    C=(1/(2*pi*f*Xcr))*1000000000000
    
    disp('Indutancia [mH]');
    L=(Xl/(2*pi*f))/1000
    
    disp('Resistencia [Ohms]');
    R=sqrt((L/1000)/(C/1000000))/fq
    
end