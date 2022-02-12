clc
clear all
close all

f = 10^6;
m = 1-17/50;
t = 0:pi/(1000*f):pi/f;

t0 = 10*pi/(f);
y = sin(2*pi*f*t);
plot(t,y);
hold on;
y1 = (square(f*t0*(1+m*y))+1)/2;
y2 = y1.*y;
plot(t,y1,'g');
figure;
plot(t,y2)




