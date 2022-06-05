function [a,condG,p]=metodoEN(A,b)
% input A = matrice m × n, m > n
% input b = vettore termine noto di m
% output a = vettore soluzione nel senso dei minimi quadrati del sistema lineare
% sovraderterminato Ax=b, ottenuto mediante  il metodo delle Equazioni
% Normali

% Risolvi il sistema delle equazioni normali A'*A a = A'b
 
%Costruzione matrice e termine noto

%to do 
G=A'*A;                                 %ADD
condG=cond(G);                          %ADD
z=A'*b;                                 %ADD

%fattorizzazione di Choleski
%to do
[L,p]=chol(G,"lower");                  %ADD

%Soluzione del sistema triangolare inferiore
%to do
if p>0                                  %ADD
    disp("G non é definita positiva");  %ADD
    a=G\z;                              %ADD
    return                              %ADD
else
    b1=Lsolve(L,z);                     %ADD
    a=Usolve(L',b1);                    %ADD
end

%Soluzione del sistema triangolare inferiore

