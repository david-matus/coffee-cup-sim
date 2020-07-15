function M=modMatrix(M)
for i=2:101
    for j=2:101
        State=zeros(1,5);
        if M(i,j)
            State(1)=1;
            State(2)=M(i+1,j);
            State(3)=M(i,j+1);
            State(4)=M(i-1,j);
            State(5)=M(i,j-1);
            L=randomwalk(State);
            M(i,j)=L(1);
            M(i+1,j)=L(2);
            M(i,j+1)=L(3);
            M(i-1,j)=L(4);
            M(i,j-1)=L(5);
        end
    end
end
end