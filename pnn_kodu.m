
clc;
clear;
clear all;

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
  
    pnn=newpnn(xe,t,8.0); 
  ye1=sim(pnn,xe);
  ye=vec2ind(ye1);
  n=0;
  
  for i=1:ne(k)
    if yed(i)==ye(i) 
      n=n+1;
    end
  end
  
  dogruluk_eg(k) = 100*(n/ne(k))

  yt1=sim(pnn,xt);
  yt=vec2ind(yt1);
  n=0;
  for i=1:nt(k)
    if ytd(i)==yt(i) 
      n=n+1;
    end
  end
  dogruluk_ts(k)=100*(n/nt(k))
end

dogruluk_ep = mean(dogruluk_eg)

dogruluk_tp = mean(dogruluk_ts)

