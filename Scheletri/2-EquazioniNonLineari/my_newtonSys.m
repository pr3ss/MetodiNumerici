function [x1,Xm,it]= my_newtonSys(fun,jac,x0,tolx,tolf,nmax)
%
% Funzione per la risoluzione del sistema f(x)=0
% mediante il metodo di Newton Raphson.
%
% INPUT:
%      fun, jac  nomi dei file contenenti rispettivamente 
%                il vettore di funzioni  non lineari e 
%                la matrice Jacobiano del vettore di funzioni non lineari
%         x0     vettore colonna contenente l'approssimazione iniziale della soluzione
%         tolx     parametro di tolleranza per l'errore tra due iterati
%         successivi
%           tolf: tolleranza sul valore della funzione
% OUTPUT:
%         x      vettore soluzione del sistema non lineare
%         Xm   vettore contenente l'errore relativo tra due soluzioni
%         successive
%       it     numero di iterazioni fatte per ottenere l'approssimazione desiderata
%

matjac=jac(x0);
if det(matjac)==0
       x1=[];  %ADD
       Xm=[];  %ADD
       it=[];  %ADD
       return
else
    s=matjac\fun(x0);                 %ADD
    
    %aggiornamento della soluzione
    it=1;
    x1=x0-s;                          %ADD
    fx1=fun(x1);                      %ADD
end

Xm=[norm(s,1)/norm(x1,1)]
while  it<=nmax && norm(fx1,1)>=tolf && norm(s,1)>=tolx*norm(x1,1) %ADD
   x0=x1;
   it=it+1;
   matjac=jac(x0);
   if det(matjac)==0
       x1=[];   %ADD
       Xm=[];   %ADD
       it=[];   %ADD
       return
   else
   %Risolvo il sistema lineare aventa come matrice dei coefficienti la
   %matrice Jacobiana e come termine noto la Funzione vettoriale F valutata
   %in x0
      
    s=matjac\fun(x0);                %ADD
    %aggiornamento della soluzione
    x1=x0-s;                         %ADD
    fx1=fun(x1);                     %ADD
    
    Xm=[Xm;norm(s,1)/norm(x1,1)];
   end
end
 




if it==nmax
   disp('Il procedimento non converge con la ');
   disp('precisione desiderata.');
   disp('Dopo 100 passi'); 
   fprintf('\t\t norma = %f .',norm(x-x0,'inf'));
end

