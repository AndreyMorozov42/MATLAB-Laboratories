clc
clear all
close all

x = -pi:0.01:pi;
f = 1/2-pi/4+pi^2/6;



%первый график
x1 = -pi:0.01:0;
f1 = 1+x1; 

%второй график
x2 = 0:0.01:pi;
f2 = x2.^2;

for k = 1:1:100
    f = f+(1/(pi*k^2)*(1-(-1)^k)+2/k^2*(-1)^k)*cos(x.*k)+(((-1)^k-1)/(pi*k)-(-1)^k/k -pi*(-1)^k/k + 2*((-1)^k-1)/(pi*k^3))*sin(x.*k);
plot(x1,f1);
hold on;
plot(x2,f2);
hold on;
plot(x,f,'r');
hold on;
grid on;
pause;
close
end;

