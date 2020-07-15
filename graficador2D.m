function graficador2D(M,name)
%Esta función se encarga de desplegar los datos en una gráfica y almacenar
%los datos como una imagen png
cornerx=[0,100];
cornery=[0,100];
for y=1:100
    %aqui
    size=0;
    for n=1:100
        %aqui
        if M(n,y)
            size=size+1;
        end
    end
    U=zeros(1,size);
    V=zeros(1,size);
    k=1;
    for x=1:100
        %aqui
        if M(x,y)
            V(k)=y;
            U(k)=x;
            k=k+1;
        end
    end
    if ~isempty(V)
        plot(U,V,'b*')
        hold on
    end
end
plot(cornerx,cornery,'o')
grid off
title('Simulación de taza de café')
hold off
saveas(gcf,name)