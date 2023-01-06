clc
clear all
load('data12v.mat')

figure(4)
plot(data(5,:),data(1,:),data(5,:),data(2,:),data(5,:),data(3,:),data(5,:),data(4,:))
title('DMÝHA devir-DGM eðrisi')
xlabel('DGM degeri')
ylabel('devir/saniye')
grid on
legend('1. motor','2.motor','3.motor','4.motor')