clc
clear all
close all

f = 10^6;
m = 1-17/50;
t = 0:pi/(100*f):5*pi/f;

y = sin(2*pi*f*t);
y1 = (square(f*t/2)+1)/2;

subplot(1,2,1);
plot(t,y);
hold on;
plot(t,y1,'r');

subplot(1,2,2);
y2 = sin(2*pi*f.*(1+m*y1).*t);
plot(t,y2);

