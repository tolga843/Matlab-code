%egriUydur
clc
clear all
load('data3s.mat')
% data1=data(:,7:108);
data1=data(:,5:53);
dt=['1' '2' '3' '4'];
for i2=1:10
    i2
for i1=1:4
y1=data1(5,:);
x1=data1(i1,:);
   
d(i1,:)=polyfit(x1,y1,i2);
s(i1,:)=polyval(d(i1,:),x1);
figure(1)
subplot(2,2,i1)
plot(x1,y1,x1,s(i1,:))
title(dt(i1))
grid on

figure(2)
subplot(2,2,i1)
plot(s(i1,:),x1)
title(dt(i1))
grid on

end
% pause
clear d

figure(3)
plot(s(1,:),x1,s(2,:),x1,s(3,:),x1,s(4,:),x1)
grid on

end