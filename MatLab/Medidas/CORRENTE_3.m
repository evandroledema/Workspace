
dados=load('C:\Documents and Settings\LabMedidas\Desktop\corrente_60hz.tab');
a=dados(:,2);
b=dados(:,3);
c=dados(:,4);
t=dados(:,1);
figure,plot(t,a,'b',t,b,'r',t,c,'g');




