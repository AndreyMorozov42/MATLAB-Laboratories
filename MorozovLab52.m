clc
clear all
close all

dt = 0.1;
T = 10;

[x,y] = meshgrid(-5:dt:5, -5:dt:5);
[u,v] = meshgrid(-pi/dt:2*pi/T:pi/dt, -pi/dt:2*pi/T:pi/dt);

r = zeros(101,101);

r(40:80,30:55) = 1;
subplot(2,1,1);
surf(x, y, r);
shading interp;

R = dt^2/(2*pi)*fft2(r);
R = fftshift(R.*conj(R));
subplot(2,1,2);
surf(u, v, R);
shading interp;

r1 = r;
r1(:, 51) = 1.1;
r1(51, :) = 0.1;
figure;
imagesc(x(:), y(:), r1);

figure;
rsliceXZ = r(51,:);
rsliceYZ = r(:,51);
plot(y, rsliceXZ,'b');
hold on;
plot(y, rsliceYZ);

figure;
R1 = R;
R1(:,51) = 2;
R1(51,:) = 1;
imagesc(u(:),v(:),R1);
axis([-10 10 -10 10]);

figure;
rsliceXZ = R(51,1:end);
rsliceYZ = R(1:end,51);
plot(y, rsliceXZ,'g');
hold on;
plot(y, rsliceYZ, 'r');
