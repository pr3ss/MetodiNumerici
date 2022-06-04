function [L,U,P,flag]=LU_parziale(A)
% Implementazione eplicitando solo il ciclo in k ( fa le operazioni su tutta la
% sottomatrice da modificare al passo k)

% Fattorizzazione PA=LU con pivot parziale
% In output:
%  L matrice triangolare inferiore
%  U matrice triangolare superiore
%  P matrice di permutazione sulle righe
%    tali che  PA=LU
  
  % Test dimensione
  [n,m]=size(A);
  flag=0;
  if n ~= m, disp('errore: matrice non quadrata'),  L=[]; U=[]; P=[]; flag=1; return, end
  % Copia A in U  
  U=A; 
  P=eye(n);
  % Fattorizzazione
  for k=1:n-1
      %Scelta pivot parziale + scambi su U e P
      %Al passo k calcolo l'indice di riga (a partire da k) in cui si trova
      %l'elemento di modulo massimo della colonna k-esima
      [pivot,ir_pivot]=max(abs(U(k:n,k))); 
      ir_pivot=ir_pivot+(k-1); 
      if pivot == 0
          L=[];                 %ADD
          flag=1;               %ADD
          return
      end
      %Se l'indice di riga ir_pivot in cui si trova l'elemento di modulo massimo
      %della colonna k-esima e' diverso da k, facciamo lo scambio tra la
      %riga k-esima e la riga ir_pivot. Facciamo lo scambio anche sulle
      %corrispondenti righe della matrice identità per memorizzare gli
      %scambi effettuati
      if ir_pivot  ~= k
         temp=U(k,:);           %ADD
         U(k,:)=U(ir_pivot,:);  %ADD
         U(ir_pivot,:)=temp;    %ADD
         temp=P(k,:);           %ADD
         P(k,:)=P(ir_pivot,:);  %ADD
         P(ir_pivot,:)=temp;    %ADD
      end
      %Procediamo con l'eliminazione gaussiana classica
      %Eliminazione gaussiana
	  %Scrivi qui il codice che modifica le righe successive alla k-esima
      % calcola il moltiplicatore per la riga i
      %modifica la riga i negli elementi di posizione j da k+1 in avanti
      U(k+1:n,k) = U(k+1:n,k)/U(k,k);                                          %ADD
      U(k+1:n,k+1:n) = U(k+1:n,k+1:n)-U(k+1:n,k)*U(k,k+1:n);                 %ADD
 end
  
  L=tril(U,-1)+eye(n) ; % Estrae i moltiplicatori                           %ADD
  U=triu(U) ;           % Estrae la parte triangolare superiore+diagonale   %ADD
  
