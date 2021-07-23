clc
clear all
disp('|------------------------------------|')
disp('|---------FILTRO---DE----------------|')
disp('|------------------------------------|')
disp('|---------LINHA----------------------|')
disp('|------------------------------------|')
disp('|---ACADEMICO:-THAIS KEMPNER---------|')
disp('|------------------------------------|')

    H=input('Ordem Harmonica:');
    I=input('Nivel Harmonica [A]:');
    Vb=input('Tensao Base (Fase-Fase) [V]:');
    Pb=input('Potencia Base [MVA]:');
    w=input('Frequencia Base [Rad/s]:');
    Vm=input('Maxima Tensao Possivel [pu]:');
    Q=input('Fator de Qualidade [30 a 60]:');

disp('Frequencia angular de ressonancia')   
w0=(w*H)

disp('Desvio equivalente da Frequencia')
df=(((w-w0)/w0)*-1)

disp('Angulo da Impedancia [°]')
Ai=atan(2*df*Q)*(180/pi)

disp('Desvio Maximo Equivalente da Frequencia [pu]:')
Dm=(1+cos(Ai*pi/180))/(2*Q*sin(Ai*pi/180))

disp('Angulo Maximo da Impedancia [°]')
Am=atan(2*Dm*Q)*(180/pi)

disp('Corrente Ordem 11 gerada pela Fonte Harmonica [pu]')
In=(I/0.1)/((Pb*10000000)/(sqrt(3)*Vb))

disp('Resistencia Efetiva [pu]')
Rp=(cos(Am*pi/180)*sin((Ai*pi/180)+(Am*pi/180))*Vm)/In

disp('Capacitancia [pu]')
Cp=1/(H*Q*Rp)

disp('Indutancia [pu]')
Lp=1/((H^2)*Cp)

disp('Potencia Reativa [pu]')
Qp=((H^2)/((H^2)-1))*Cp

disp('Maxima Corrente Harmonica [pu]')
Ip=In/sin((Ai+Am)*pi/180)

disp('Capacitancia Base [uF]')
Cbase=(Pb*1000000/((Vb^2)*w))*1000000

disp('Indutancia Base [mH]')
Lbase=((Vb^2)/(Pb*1000000*w))*1000

disp('Impedancia Base [Ohms]')
Zbase=(Vb^2)/(Pb*1000000)

disp('Corrente Base [A]')
Ibase=(Pb*1000000)/(sqrt(3)*Vb)

disp('------------------------------------')
disp('------------FILTRO------------------')
disp('------------------------------------')

disp('Capacitancia do Filtro [uF]')
C=Cbase*Cp

disp('Indutancia do Filtro [mH]')
L=Lbase*Lp

disp('Resistencia do Filtro [Ohms]')
R=Zbase*Rp

disp('Maxima Corrente Harmonica [A]')
Im=Ibase*Ip

end