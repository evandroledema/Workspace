clear
close all
n=input('Numero da Ultima Harmonica = ');
disp(' ');
x=[1:1:n];
y=input('Amplitude da fundamental =');
disp(' ');
for a=2:1:n;
    a1=int2str(a);
    N=input(['Valor da Harmonica de ordem ' a1 ':']);
    y=[y; N];
    disp(' ');
end
bar(x,y)
xlabel('Ordem Harmônica');
ylabel('Tensão (kV)');