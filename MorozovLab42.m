clc
clear all
close all

% для изменения интервала
a = 1;

m = 17;
n = 8;
dt = 0.1;
t = 0:dt:a*(m+n);

% график прямоугольной функции
f = n*rectpuls(t-21, 8);
subplot(5,1,1);
plot(t,f);

T = a*(m+n);
dw = 2*pi/T;
w = -pi/dt:dw:pi/dt;

% ПФ по формуле
F = -8./(i*w.*sqrt(2*pi)).*(exp(-25*i.*w) - exp(-17*i.*w));
F = F.*conj(F);
subplot(5,1,2);
plot(w,F);


% ДПФ
N = length(f);
F = zeros(1,N);
for k=1:N
    for n=1:N
        F(k) = F(k) + f(n).*exp(-i*2*pi*k*n/N);
    end;
end;
F = dt/sqrt(2*pi)*F;
F = fftshift(F);
F = F.*conj(F);
subplot(5,1,3);
plot(w,F);


% ДПФ с матрицей
A = ones(N,N);
for n=1:N-1
    for k=1:N-1
        A(n,k) = exp(-2*i*pi*(n-1)*(k-1)/N);
    end;
end;
F = dt/sqrt(2*pi)*A*f';
F = F.*conj(F);
F = fftshift(F);
subplot(5,1,4);
plot(w,F);

% БПФ
F =  dt/sqrt(2*pi)*fft(f);
F = F.*conj(F);
F = fftshift(F);
subplot(5,1,5);
plot(t,F);
