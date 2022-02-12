clc
clear all
close all

f = 10^6;
m = 1-17/50;
t = 0:pi/(100*f):9*pi/f;

y = sin(2*pi*f*t);
y1 = sin(2*pi*f/10*t);

subplot(1,2,1)
plot(t,y);
hold on;
plot(t,y1,'r');

subplot(1,2,2);
ym = y.*(1+m*y1);
plot(t,ym);