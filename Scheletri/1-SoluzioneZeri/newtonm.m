function [x1,xk,it]=newtonm(fname,fpname,x0,tolx,tolf,nmax)

fx0=fname(x0);
dfx0=fpname(x0);
if abs(dfx0)>eps
    d=fx0/dfx0;     %ADD
    x1=x0-m*d;      %ADD DIFF
    fx1=fname(x1);  %ADD
    it=1;           %ADD
    xk(it)=x1;      %ADD
    
else
    fprintf('Derivata nulla in x0 - EXIT \n')
    x1=[];          %ADD
    xk=[];          %ADD
    it=[];          %ADD
    return
end

while it<nmax && abs(fx1)>=tolf && abs(d)>=tolx*abs(x1)  %ADD
    x0=x1;
    fx0=fname(x0);
    dfx0=fpname(x0);
    if abs(dfx0)>eps
        d=fx0/dfx0;           %ADD
        x1=x0-m*d;            %ADD DIFF
        fx1=feval(fname,x1);  %ADD
        it=it+1;              %ADD
        xk(it,:)=x1;          %ADD
         
    else
        fprintf('Derivata nulla in xi - EXIT \n')
        disp(dfx0)
        break
    end
end
if it==nmax
    fprintf('raggiunto massimo numero di iterazioni \n');
end

