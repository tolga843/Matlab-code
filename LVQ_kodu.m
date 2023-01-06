clc;
clear;
clear all;

egit1 = importdata('egitim.txt');
test1 = importdata('test.txt');

ne = [447];
nt = [193];

for k=1:1
  ep=50;
  oran=[0.25 0.75];
  switch k
    case 1, 
      xe=egit1(:,1:6)';
      yed=egit1(:,7)';
      xt=test1(:,1:6)';
      ytd=test1(:,7)'; 
  end
   
  t=ind2vec(yed); 

  lvq = newlvq(minmax(xe),52,oran,0.09);
  lvq.trainParam.epochs=250;
  lvq.trainParam.show=6;
  lvq.trainParam.goal=0.0734;
  lvq=train(lvq,xe,t);

  yel1=sim(lvq,xe);
  yel=vec2ind(yel1);
  n=0;
  for i=1:ne(k)
    if yed(i)==yel(i) 
      n=n+1;
    end
  end
  dogruluk_egl(k) = 100*(n/ne(k))

  ytl1=sim(lvq,xt);
  ytl=vec2ind(ytl1);
  n=0;
  for i=1:nt(k)
    if ytd(i)==ytl(i) 
      n=n+1;
      
    end
  end
  dogruluk_tsl(k)=100*(n/nt(k))

end