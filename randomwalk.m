function L=randomwalk(State)
c=1;
tries=0;
L=State;
while (tries<4) && c
    %los valores de r determinan el movimiento, 1 es no moverse, de 2 a 5
    %es moverse comenzando por la derecha y en sentido antihorario
    r=randi([1,5]);
    switch r
        case 1
            c=false;
            L=State;
        case {2, 3, 4, 5}
            if State(r)==1
                tries=tries+1;
            else
                L(1)=0;
                L(r)=1;
                c=false;
            end
    end
end
end