clc
clear all
close all

dt = 0.1;
T = 20;

[x, y] = meshgrid(-10:dt:10);
[u, v] = meshgrid(-pi/dt:2*pi/T:pi/dt);

g = 1/(2*pi)*exp(-1/2*(x.^2+y.^2));
G1 = 1/(2*pi)*exp(-1/2*(u.^2+v.^2));

G2 = dt^2/(2*pi)*fft2(g);
G2 = fftshift(abs(G2));

subplot(3,1,1);
surf(x, y, g);
axis([-5 5 -5 5 0 0.2]);
shading interp;

subplot(3,1,2);
surf(u, v, G1);
axis([-5 5 -5 5 0 0.2]);
shading interp;

subplot(3,1,3);
surf(u, v, G2);
axis([-5 5 -5 5 0 0.2]);
shading interp;

disp(sum(sum(g))*dt^2);
disp(sum(sum(G1))*(2*pi/T)^2);