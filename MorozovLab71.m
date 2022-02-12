clc
clear all
close all

a = 0.00000000001;
dt = 0.05;
T = 20;

[x, y] = meshgrid(-10:dt:10);
[u, v] = meshgrid(-pi/dt:2*pi/T:pi/dt);

f1 = 1/(2*pi)*exp(-(x-2).^2/2 - (y-0.15).^2/2);
f2 = 1/(2*pi)*exp(-(x-1).^2/2 - (y+1.5).^2/2);
f = f1 + f2;

o = 0.9;
h = 1/(2*pi*o^2)*exp(-1/o^2*(x.^2/2+y.^2/2));

F = dt^2/(2*pi)*fftshift(fft2(f));
H = dt^2/(2*pi)*fftshift(fft2(h));

H0 = a*max(max(abs(H)));
Ha = H.*conj(H);
Ha(Ha < H0) = H0;

p = abs(fftshift(ifft2(F.*conj(H)./Ha)));
P = dt^2/(2*pi)*fftshift(fft2(p));

surf(x,y,f);
shading interp;

figure;

imagesc(x(:), y(:), f);
colormap('gray');

figure;

surf(u, v, abs(F).^2);
shading interp;

figure;

imagesc(u(:), v(:), abs(F).^2);
colormap('gray');

figure;

surf(x, y, h);
shading interp;

figure;

imagesc(x(:), y(:), h);
colormap('gray');

figure;

surf(u, v, abs(H).^2);
shading interp;

figure;

imagesc(u(:), v(:), abs(H).^2);
colormap('gray');

figure;

surf(x, y, p);
shading interp;

figure;

imagesc(x(:), y(:), p);
colormap('gray');

figure;

surf(u, v, abs(P).^2);
shading interp;

figure;

imagesc(u(:), v(:), abs(P).^2);
colormap('gray');
axis([-20 20 -20 20]);
