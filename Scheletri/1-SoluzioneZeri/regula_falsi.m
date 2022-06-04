function [x, xk, it] = regula_falsi(fname,a,b,tol,nmax)
       
fa=fname(a);
fb=fname(b);
if sign(fa)*sign(fb)>=0
   error('intervallo non corretto');
else
    it=0;
    fxk=fname(a);
    while  it<=nmax && abs(b-a)>=toll && abs(fxk)>=toll %ADD
        it=it+1;
        xk(it)= a-fa*(b-a)/(fb-fa);                     %ADD
        %fprintf('it=%d  x=%8.15f \n',it,xk(it));
        fxk=fname(xk(it));
        if fxk==0
            break;
        elseif sign(fxk)*sign(fa)>0
             a=xk(it);   %ADD
             fa=fxk;     %ADD
        elseif sign(fxk)*sign(fb)>0
             b=xk(it);   %ADD
             fb=fxk;     %ADD
        end
    end
    if it==nmax 
        error('Raggiunto numero max di iterazioni');
        x=[];
    else
        x=xk(it);
    end
end
