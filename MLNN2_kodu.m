egit1 = importdata('egitim.txt');
test1 = importdata('test.txt');

ne = [447];
nt = [193];

for k=1:1
  switch k
    case 1, 
      xe=egit1(:,1:6)';
      yed=egit1(:,7)';
      xt=test1(:,1:6)';
      ytd=test1(:,7)';   
  end
   
  t=ind2vec(yed); 

  mlnn2 = newff(minmax(xe),[90 30 1],{'tansig' 'tansig' 'tansig'},'traingdx');
  mlnn2.trainParam.epochs=300;
  mlnn2.trainParam.show=5;
  mlnn2.trainParam.min_grad=0;
  mlnn2.trainParam.goal=2e-3;
  yedm=yed/4;
  mlnn2=train(mlnn2,xe,yedm);
  yem2=sim(mlnn2,xe);
  yem2=round(yem2*4);
  n=0;
  for i=1:ne(k)
   if yed(i)==yem2(i) 
     n=n+1;
   end
  end
  dogruluk_egm2(k) = 100*(n/ne(k))

  ytm2=sim(mlnn2,xt);
  ytm2=round(ytm2*4);
  n=0;
  for i=1:nt(k)
    if ytd(i)==ytm2(i) 
      n=n+1;
    end
   end
   
  dogruluk_tsm2(k)=100*(n/nt(k))


end