function A1=inversa(A)

I=eye(size(A));
[L,U,P,flag]=LU_nopivot(A);
A1=zeros(size(A));

for i=1:n
    b=I(:,i);
    [x,flag]=LU_SOLVE(L,U,P,b);  %Se si una gaus con pivoting b ->  P*b ;
    A1(:,i)=x;
end
