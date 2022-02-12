clc
clear all
close all

dt = 0.1;
t = -5:dt:5;

f = 1*rectpuls(t, 2);
f1 = exp(-t);
f1(1:50) = 0;


fc = 0*rectpuls(t, 2);
fc2 = 1 - exp(-t-1);
fc3 = exp(1-t)-exp(-t-1);

fc(41:60) = fc2(41:60);
fc(61:end) = fc3(61:end);

figure;
fconvauto = conv(f, f1, 'same')/10;

subplot(3,1,1);
plot(t,fc);

subplot(3,1,3);
plot(t, f);
hold on;
plot(t, f1);
hold on;
plot(t,fconvauto, 'r');

