clc
clear var
'     ';
fprintf('---------------------------------------------------------------------------------------------\n');
fprintf('                  Dados carregado para c�lculo de fluxo de pot�ncia                          \n'); 
fprintf('---------------------------------------------------------------------------------------------\n'); 
type Exemplo_Slides.txt  
dados = load('Exemplo_Slides.txt');
[a1,a2] = size(dados);
%Dados em matriz coluna:
de = dados(1:a1,1); %De 	
para = dados(1:a1,2); %P/	
tap = dados(1:a1,7); %akm tap
fi = dados(1:a1,8); %fikm
barra = dados(1:a1,9); %B
tipo = dados(1:a1,10);%T
Vk = dados(1:a1,11); %Vk
teta = dados(1:a1,12); %Ok
Pg = dados(1:a1,13); %Pgk
Qg = dados(1:a1,14); %Qgk
Pc = dados(1:a1,15); %Pck
Qc = dados(1:a1,16); %Qck
Qmin = dados(1:a1,17); %Qmin
Qmax = dados(1:a1,18); %Qmax
gshk = dados(1:a1,19); %gshk
bshk = dados(1:a1,20); %bshk
a3 = find(de); %encontra elementos diferente de zero
[nr,a4] = size(a3);%nr-->numero de ramos
barra1 = find(barra);
[nb,an] = size(barra1); %nb -->numero de barras
ch=[];

%C�lculo das admit�ncias
for i = 1:nr;
        zkm(i) = dados(i,3)+dados(i,4)*1i;
        ykm(i) =inv(zkm(i));
        bshkm(i) = dados(i,5)/2;
        gshkm(i) = dados(i,6)/2;
end
ykm = reshape(ykm,nr,1);
gkm = real(ykm);
bkm = imag(ykm);
gshkm = reshape(gshkm,nr,1);
bshkm = reshape(bshkm,nr,1);

% %�ngulos 
 for i = 1:nb
     teta(i) = teta(i)*(pi/180);
%     fi(i) = fi(i)*(pi/180);
end
for i=1:nr
     k=de(i);
     m=para(i);
     fi2(k,m)=fi(i);
     fi2(m,k)=fi(i);
 end

%Admit�ncia de barra
Bd(1:nb,1)=0;% d diagonal
Gd(1:nb,1)=0;

for i = 1:nr
     s=find(ch==i);
     if isempty(s);
         k = de(i);
         m = para(i);
         Gd(k)=Gd(k)+(tap(i)^2)*gkm(i);
         Gd(m)=Gd(m)+gkm(i);
         Bd(k)=bshk(k)+Bd(k)+(bshkm(i)+(tap(i)^2)*bkm(i));
         Bd(m)=bshk(m)+Bd(m)+(bshkm(i)+bkm(i));
         continue
     end
end

 Bfd=zeros(nb); %fd fora da diagonal
 Gfd=zeros(nb);
 
 %Admit�ncia nos ramos
 for i=1:nr
     k=de(i);
     m=para(i);
     if fi(i)==0
         Gfd(k,m)=-tap(i)*gkm(i);
         Gfd(m,k)=Gfd(k,m);
         Bfd(k,m)=-tap(i)*bkm(i);
         Bfd(m,k)=Bfd(k,m);
     else
         Gfd(k,m)=-tap(i)*gkm(i)*(cos(fi(i))-sin(fi(i))*1i);
         Gfd(m,k)=-tap(i)*gkm(i)*(cos(fi(i))+sin(fi(i))*1i);
         Bfd(k,m)=-tap(i)*bkm(i)*(cos(fi(i))-sin(fi(i))*1i);
         Bfd(m,k)=-tap(i)*bkm(i)*(cos(fi(i))+sin(fi(i))*1i); 
     end 
 end
G1=diag(Gd)+Gfd;
B1=diag(Bd)+Bfd;
Y=G1+B1*1i;
G = real(Y);
B = imag(Y);

%flat start considerando todas as tens�es 1 com �ngulo 0�
Pk(1:nb,1)=0;% d diagonal
Qk(1:nb,1)=0;
V=Vk;
for k=1:nb
    for m=1:nb
        if fi(i)==0
            Pk(k)=Pk(k)+V(k)*(V(m)*(G(k,m)*cos(teta(k)-teta(m))+B(k,m)*sin(teta(k)-teta(m))));
            Qk(k)=Qk(k)+V(k)*(V(m)*(G(k,m)*sin(teta(k)-teta(m))-B(k,m)*cos(teta(k)-teta(m))));
        else
            Pk(k)=Pk(k)+V(k)*V(m)*(G(k,m)*cos(teta(k)-teta(m)+fi2(k,m))+B(k,m)*sin(teta(k)-teta(m)+fi2(k,m)));
            Qk(k)=Qk(k)+V(k)*V(m)*(G(k,m)*sin(teta(k)-teta(m)+fi2(k,m))-B(k,m)*cos(teta(k)-teta(m)+fi2(k,m)));
        end 
    end
end
Pk=vpa(Pk,6);
Qk=vpa(Qk,6);