clc
clear all
disp('-----------------------------------------------------------------------------------')
disp('TRANSFORMADORES TRIFASICOS')
disp('-----------------------------------------------------------------------------------')
disp('OBS:Tensoes Fase-Fase e Potencia Trifasica')
disp('-----------------------------------------------------------------------------------')
Lig1=input('Ligaçao do Primario Delta [0] ou Estrela [1]: ');
Lig2=input('Ligaçao do Secundario Delta [0] ou Estrela [1]: ');
if (Lig1==1 & Lig2==0)
    f=input('Frequencia [Hz]: ');
    Up=input('Tensao Primaria [V]: ');
    Us=input('Tensao Secundaria [V]: ');
    S=input('Potencia Aparente Trifasica [kVA]: ');
    X=input('Reatancia do Transformador [%]: ');
    Po=input('Potencia do Ensaio a Vazio [W]: ');
    Pcc=input('Potencia do Ensaio de Curto-Circuito [W]: ');
      disp('Coeficiente Angular:')    
      w=2*pi*f
      disp('Relaçao de Transformaçao:')
      a=(Up/Us)
      if a>=1
         disp('Corrente Primaria de Linha  [A]:')
         ILp=(S*1000)./(Up*sqrt(3))
         disp('Corrente Primaria de Fase [A]:')
         IFp=ILp
         disp('Corrente Secundaria de Linha [A]:')
         ILs=(a*ILp)   
         disp('Corrente Secundaria de Fase [A]:')
         IFs=(ILs/sqrt(3))
         disp('Reatancia Equivalente [Ohms]:')
         Xeq=((Up^2)*X)./(S*1000*100)              
         disp('Reatancia do Primario [Ohms]:')
         Xp=(Xeq/2)     
         disp('Indutancia do Primario [mH]:')
         LpmH=((Xp*1000)./w)
         disp('Reatancia do Secundario [Ohms]:')
         Xs=(Xp/(a^2))
         disp('Indutancia do Secundario [mH]:')
         LsmH=((Xs*1000)./w)
         disp('Resistencia Equivalente [Ohms]:')
         Req=(Pcc./(ILp^2))         
         disp('Resistencia do Primario [Ohms]:')
         Rp=(Req./2)
         disp('Resistencia do Secundario [Ohms]:')
         Rs=(Rp)./(a^2)          
         disp('Resistencia de Magnetizaçao [Ohms]:')
         Rmag=((Up^2)/Po)
         disp('Tensao de Curto-Circuito [V]:')
         Zp=sqrt((Rp^2)+(Xp^2));
         Vcc= ((Zp*ILp).*2)*.666
      else a<1
         disp('Corrente Primaria de Linha  [A]:')
         ILp=((S*1000)./(Up*sqrt(3)))
         disp('Corrente Primaria de Fase [A]:')
         IFp=ILp
         disp('Corrente Secundaria de Linha [A]:')
         ILs=(a*sqrt(3)*ILp)   
         disp('Corrente Secundaria de Fase [A]:')
         IFs=(ILs/sqrt(3))
         disp('Reatancia Equivalente [Ohms]:')
         Xeq=((Us^2)*X)./(S*1000*100)              
         disp('Reatancia do Primario [Ohms]:')
         Xp=((Xeq)/2)*(a^2)     
         disp('Indutancia do Primario [mH]:')
         LpmH=((Xp*1000)./w)
         disp('Reatancia do Secundario [Ohms]:')
         Xs=(Xeq./2)
         disp('Indutancia do Secundario [mH]:')
         LsmH=((Xs*1000)./w)
         disp('Resistencia Equivalente [Ohms]:')
         Req=(Pcc./(ILs^2))         
         disp('Resistencia do Primario [Ohms]:')
         Rp=(Req./2)*(a^2)
         disp('Resistencia do Secundario [Ohms]:')
         Rs=(Req./2)          
         disp('Resistencia de Magnetizaçao [Ohms]:')
         Rmag=((Up^2)/Po)
         disp('Tensao de Curto-Circuito [V]:')
         Zs=sqrt((Rs^2)+(Xs^2));
         Vcc= ((Zs*IFs).*2).*1.154
      end
elseif (Lig1==0 & Lig2==0)
    f=input('Frequencia [Hz]: ');
    Up=input('Tensao Primaria [V]: ');
    Us=input('Tensao Secundaria [V]: ');
    S=input('Potencia Aparente Trifasica [kVA]: ');
    X=input('Reatancia do Transformador [%]: ');
    Po=input('Potencia do Ensaio a Vazio [W]: ');
    Pcc=input('Potencia do Ensaio de Curto-Circuito [W]: ');
      disp('Coeficiente Angular:')    
      w=2*pi*f
      disp('Relaçao de Transformaçao:')
      a=(Up/Us)
      if a>=1
         disp('Corrente Primaria de Linha  [A]:')
         ILp=((S*1000)./(Up*sqrt(3)))
         disp('Corrente Primaria de Fase [A]:')
         IFp=(ILp/sqrt(3))
         disp('Corrente Secundaria de Linha [A]:')
         ILs=(a*ILp)   
         disp('Corrente Secundaria de Fase [A]:')
         IFs=(ILs/sqrt(3))
         disp('Reatancia Equivalente [Ohms]:')
         Xeq=((Up^2)*X)./(S*1000*100)              
         disp('Reatancia do Primario [Ohms]:')
         Xp=(Xeq/2)     
         disp('Indutancia do Primario [mH]:')
         LpmH=((Xp*1000)./w)
         disp('Reatancia do Secundario [Ohms]:')
         Xs=(Xeq./2)./(a^2)
         disp('Indutancia do Secundario [mH]:')
         LsmH=((Xs*1000)./w)
         disp('Resistencia Equivalente [Ohms]:')
         Req=(Pcc./(ILp^2))         
         disp('Resistencia do Primario [Ohms]:')
         Rp=(Req./2)
         disp('Resistencia do Secundario [Ohms]:')
         Rs=(Req./2)./(a^2)          
         disp('Resistencia de Magnetizaçao [Ohms]:')
         Rmag=((Up^2)/Po)
         disp('Tensao de Curto-Circuito [V]:')
         Zp=sqrt((Rp^2)+(Xp^2));
         Vcc= ((Zp*IFp).*2)
      else a<1
         disp('Corrente Primaria de Linha  [A]:')
         ILp=((S*1000)./(Up*sqrt(3)))
         disp('Corrente Primaria de Fase [A]:')
         IFp=(ILp/sqrt(3))
         disp('Corrente Secundaria de Linha [A]:')
         ILs=(a*ILp)   
         disp('Corrente Secundaria de Fase [A]:')
         IFs=(ILs/sqrt(3))
         disp('Reatancia Equivalente [Ohms]:')
         Xeq=((Us^2)*X)./(S*1000*100)              
         disp('Reatancia do Primario [Ohms]:')
         Xp=((Xeq)/2)*(a^2)     
         disp('Indutancia do Primario [mH]:')
         LpmH=((Xp*1000)./w)
         disp('Reatancia do Secundario [Ohms]:')
         Xs=(Xeq./2)
         disp('Indutancia do Secundario [mH]:')
         LsmH=((Xs*1000)./w)
         disp('Resistencia Equivalente [Ohms]:')
         Req=(Pcc./(ILs^2))         
         disp('Resistencia do Primario [Ohms]:')
         Rp=(Req./2)*(a^2)
         disp('Resistencia do Secundario [Ohms]:')
         Rs=(Req./2)          
         disp('Resistencia de Magnetizaçao [Ohms]:')
         Rmag=((Up^2)/Po)
         disp('Tensao de Curto-Circuito [V]:')
         Zs=sqrt((Rs^2)+(Xs^2));
         Vcc= ((Zs*IFs).*2)
      end
elseif (Lig1==0 & Lig2==1)
    f=input('Frequencia [Hz]: ');
    Up=input('Tensao Primaria [V]: ');
    Us=input('Tensao Secundaria [V]: ');
    S=input('Potencia Aparente Trifasica [kVA]: ');
    X=input('Reatancia do Transformador [%]: ');
    Po=input('Potencia do Ensaio a Vazio [W]: ');
    Pcc=input('Potencia do Ensaio de Curto-Circuito [W]: ');
      disp('Coeficiente Angular:')    
      w=2*pi*f
      disp('Relaçao de Transformaçao:')
      a=(Up/Us)
      if a>=1
         disp('Corrente Primaria de Linha  [A]:')
         ILp=((S*1000)./(Up*sqrt(3)))
         disp('Corrente Primaria de Fase [A]:')
         IFp=(ILp/sqrt(3))
         disp('Corrente Secundaria de Linha [A]:')
         ILs=(a*ILp)   
         disp('Corrente Secundaria de Fase [A]:')
         IFs=ILs
         disp('Reatancia Equivalente [Ohms]:')
         Xeq=((Up^2)*X)./(S*1000*100)              
         disp('Reatancia do Primario [Ohms]:')
         Xp=(Xeq/2)     
         disp('Indutancia do Primario [mH]:')
         LpmH=((Xp*1000)./w)
         disp('Reatancia do Secundario [Ohms]:')
         Xs=(Xp)./(a^2)
         disp('Indutancia do Secundario [mH]:')
         LsmH=((Xs*1000)./w)
         disp('Resistencia Equivalente [Ohms]:')
         Req=(Pcc./(ILp^2))         
         disp('Resistencia do Primario [Ohms]:')
         Rp=(Req./2)
         disp('Resistencia do Secundario [Ohms]:')
         Rs=(Rp)./(a^2)          
         disp('Resistencia de Magnetizaçao [Ohms]:')
         Rmag=((Up^2)/Po)
         disp('Tensao de Curto-Circuito [V]:')
         Zp=sqrt((Rp^2)+(Xp^2));
         Vcc= ((Zp*ILp).*2).*1.154
      else a<1
         disp('Corrente Primaria de Linha  [A]:')
         ILp=((S*1000)./(Up*sqrt(3)))
         disp('Corrente Primaria de Fase [A]:')
         IFp=(ILp/sqrt(3))
         disp('Corrente Secundaria de Linha [A]:')
         ILs=(a*ILp)   
         disp('Corrente Secundaria de Fase [A]:')
         IFs=ILs
         disp('Reatancia Equivalente [Ohms]:')
         Xeq=((Us^2)*X)./(S*1000*100)              
         disp('Reatancia do Primario [Ohms]:')
         Xp=((Xeq)/2)*(a^2)     
         disp('Indutancia do Primario [mH]:')
         LpmH=((Xp*1000)./w)
         disp('Reatancia do Secundario [Ohms]:')
         Xs=(Xeq./2)
         disp('Reatancia do Secundario [mH]:')
         XsmH=((Xs*1000)./w)
         disp('Resistencia Equivalente [Ohms]:')
         Req=(Pcc./(ILs^2))         
         disp('Resistencia do Primario [Ohms]:')
         Rp=(Req./2)*(a^2)
         disp('Resistencia do Secundario [Ohms]:')
         Rs=(Req./2)          
         disp('Resistencia de Magnetizaçao [Ohms]:')
         Rmag=((Us^2)/Po)
         disp('Tensao de Curto-Circuito [V]:')
         Zs=sqrt((Rs^2)+(Xs^2));
         Vcc=((Zs*IFs).*2).*0.666
      end
elseif (Lig1==1 & Lig2==1)
    f=input('Frequencia [Hz]: ');
    Up=input('Tensao Primaria [V]: ');
    Us=input('Tensao Secundaria [V]: ');
    S=input('Potencia Aparente Trifasica [kVA]: ');
    X=input('Reatancia do Transformador [%]: ');
    Po=input('Potencia do Ensaio a Vazio [W]: ');
    Pcc=input('Potencia do Ensaio de Curto-Circuito [W]: ');
      disp('Coeficiente Angular:')    
      w=2*pi*f
      disp('Relaçao de Transformaçao:')
      a=(Up/Us)
      if a>=1
         disp('Corrente Primaria de Linha  [A]:')
         ILp=((S*1000)/(Up*sqrt(3)))
         disp('Corrente Primaria de Fase [A]:')
         IFp=ILp
         disp('Corrente Secundaria de Linha [A]:')
         ILs=(a*ILp)   
         disp('Corrente Secundaria de Fase [A]:')
         IFs=(ILs)
         disp('Reatancia Equivalente [Ohms]:')
         Xeq=(((Up/sqrt(3))^2)*X)./(S*1000*100)              
         disp('Reatancia do Primario [Ohms]:')
         Xp=(Xeq/2)     
         disp('Indutancia do Primario [mH]:')
         LpmH=((Xp*1000)./w)
         disp('Reatancia do Secundario [Ohms]:')
         Xs=(Xeq/(2*(a^2)))
         disp('Indutancia do Secundario [mH]:')
         LsmH=((Xs*1000)./w)
         disp('Resistencia Equivalente [Ohms]:')
         Req=(Pcc./(ILp^2))         
         disp('Resistencia do Primario [Ohms]:')
         Rp=(Req./2)
         disp('Resistencia do Secundario [Ohms]:')
         Rs=(Req/(2*(a^2)))          
         disp('Resistencia de Magnetizaçao [Ohms]:')
         Rmag=((Up^2)/Po)
         disp('Tensao de Curto-Circuito [V]:')
         Zp=sqrt((Rp^2)+(Xp^2));
         Vcc= ((Zp*ILp).*2)
      else a<1
         disp('Corrente Primaria de Linha  [A]:')
         ILp=((S*1000)/(Up*sqrt(3)))
         disp('Corrente Primaria de Fase [A]:')
         IFp=ILp
         disp('Corrente Secundaria de Linha [A]:')
         ILs=(a*ILp)   
         disp('Corrente Secundaria de Fase [A]:')
         IFs=(ILs)
         disp('Reatancia Equivalente [Ohms]:')
         Xeq=(((Us/sqrt(3))^2)*X)./(S*1000*100)              
         disp('Reatancia do Primario [Ohms]:')
         Xp=(Xeq/2).*(a^2)     
         disp('Indutancia do Primario [mH]:')
         LpmH=((Xp*1000)./w)
         disp('Reatancia do Secundario [Ohms]:')
         Xs=(Xeq/2)
         disp('Indutancia do Secundario [mH]:')
         LsmH=((Xs*1000)./w)
         disp('Resistencia Equivalente [Ohms]:')
         Req=(Pcc./(ILs^2))         
         disp('Resistencia do Primario [Ohms]:')
         Rp=(Req./2).*(a^2)
         disp('Resistencia do Secundario [Ohms]:')
         Rs=(Req/2)          
         disp('Resistencia de Magnetizaçao [Ohms]:')
         Rmag=((Us^2)/Po)
         disp('Tensao de Curto-Circuito [V]:')
         Zs=sqrt((Rs^2)+(Xs^2));
         Vcc= ((Zs*ILs).*2)
     end
 end
 
   

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
