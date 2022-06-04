function [x,xk,it]=bisez(fname,a,b,tol)

fa=fname(a);
fb=fname(b);
if  sign(fa)*sign(fb)>=0            %ADD
   error('intervallo non corretto');
else
    maxit= ceil(log2((b-a)/tol)-1); %ADD
    %fprintf('n. di passi necessari=%d \n',maxit);
    it=0;
    while it<=maxit && abs(b-a)>=tol
        it=it+1;
        %calcola xk(it) con la formula corrispondente
        xk(it)=a+(b-a)*0.5; %ADD
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
    x=xk(it);
end
