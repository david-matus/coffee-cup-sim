%Tarea Programada 1 - Termodinámica 1 - Semestre I 2020
%Se establece la condición inicial y el número de iteraciones
ciclos=20000;
A=zeros(100,100);
for i=46:1:55
    for j=46:1:55
        A(i,j)=1;
    end
end
%La matriz M es la que se modifica con el randomwalk, es la matriz inicial
%con una fila y una columna al inicio y al final del resto
[n,m]=size(A);
M=zeros(m+2);
for a=1:102
    M(1,a)=1;
    M(102,a)=1;
    M(a,1)=1;
    M(a,102)=1;
end
for g=1:100
    for h=1:100
        M(g+1,h+1)=A(g,h);
    end
end
name='';
iter='';
%Se grafica la condición inicial del sistema
graficador2D(A,'0.png')
%Se calcula la entropía inicial del sistema
S=zeros(1,ciclos+1);
S(1)=enthCalc(A);
ag=0:1:ciclos;
%Se ejecuta la modificación (y posible graficado de la matriz)
G=zeros(100);
for k=1:ciclos
    M=modMatrix(M);
    for u=1:100
        for v=1:100
            G(u,v)=M(u+1,v+1);
        end
    end
    %Graficando los resultados para las iteraciones deseadas, en donde los
    %cases son las iteraciones en donde se va a graficar
    switch k
        case {10, 100, 1000, 10000}
            iter=num2str(k);
            name=strcat(iter,'.png');
            graficador2D(G,name)
    end
    %Se calcula el valor de la entropía para cada iteración
    S(k+1)=enthCalc(G);
end
%Se grafica el vector de entropía respecto a las iteraciones
plot(ag,S)
hold on
ax=gca;
ax.YAxis.Limits=[1 5];
ax.XAxis.Limits=[-10 20000];
hold off
saveas(gcf,'enthropy.png')