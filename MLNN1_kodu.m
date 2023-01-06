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

  mlnn1 = newff(minmax(xe),[67 1],{'tansig' 'tansig'},'traingdx');
  mlnn1.trainParam.epochs=300;
  mlnn1.trainParam.show=10;
  mlnn1.trainParam.min_grad=0;
  mlnn1.trainParam.goal=5e-8;
  yedm=yed/4;
  mlnn1=train(mlnn1,xe,yedm);
  yem1=sim(mlnn1,xe);
  yem1=round(yem1*4);
  n=0;
  for i=1:ne(k)
    if yed(i)==yem1(i) 
      n=n+1;
    end
  end
  dogruluk_egm1(k) = 100*(n/ne(k))

  ytm1=sim(mlnn1,xt);
  ytm1=round(ytm1*4);
  n=0;
  for i=1:nt(k)
    if ytd(i)==ytm1(i) 
      n=n+1;
    end
  end
  dogruluk_tsm1(k)=100*(n/nt(k))

end