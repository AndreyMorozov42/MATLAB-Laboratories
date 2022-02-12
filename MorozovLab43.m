clc
clear all
close all

%частота
f = 10^4;
%интервал для вывода функции 
T = 5*pi/f;

%частота соответствует критерию Найквиста
f1 = 10*f;
dt1 = 1/f1;
t1 = -T:dt1:T;
y1 = sin(2*pi*f*t1);
subplot(4,1,1);
plot(t1, y1);

%частота не соответствует критерию Найквиста
f2 = 1.25*f;
dt2 = 1/f2;
t2 = -T:dt2:T;
y2 = sin(2*pi*f*t2);
subplot(4,1,2);
plot(t2, y2);

% графики спектра мощности на спектре линейных частот f
W1 = pi/dt1;
W2 = pi/dt2;
dw = pi/T;

ff1 = (0:dw:2*W1)/(2*pi);
ff2 = (0:dw:2*W2)/(2*pi);

F1 = dt1/(sqrt(2*pi))*fft(y1);
% F1 = fftshift(F1);
F1 = F1.*conj(F1);

subplot(4,1,3);
plot(ff1,F1);

F2 = dt2/(sqrt(2*pi))*fft(y2);
F2 = F2.*conj(F2);
% F2 = fftshift(F2);
subplot(4,1,4);
plot(ff2,F2);