function S=enthCalc(M)
S=0;
for m=1:10
    for n=1:10
        N=0;
        for i=1:10
            for j=1:10
                if M((m-1)*10+i,(n-1)*10+j)
                    N=N+1;
                end
            end
        end
        P=N/100;
        if P~=0
            S=S-P*log(P);
        end
    end
end
end