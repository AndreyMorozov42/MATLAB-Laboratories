clc
clear all
close all

f = 10^6;
t = 0:pi/(f*100):19*pi/f;
y = sin(2*pi*f*t);
y1 = sin(2*pi*f*t*0.909);

subplot(1,2,1);
plot(t,y);
hold on;
plot(t,y1,'r');
axis([0,3/f,-1,1]);

y2 = y + y1;
subplot(1,2,2);
plot(t,y2);
% axis([0.5,6,-2,2]);