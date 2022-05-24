clc; clear; close all;

R=[0:1e-8:1e-6];
deg=[0:1:90];
driv=1e6;

imax=numel(R);
dmax=numel(deg);
gam0=0.3;
alp=0.2;

for i=1:imax % i 반지름 
for j=1:dmax % j 각도
    rad=deg(j)/180*pi;
    inter(i,j)=gam0*(1+alp*cos(4*rad))*2*pi*R(i);
    vol(i)=-driv*pi*R(i)^2;
    G(i,j)=inter(i,j)+vol(i);

end
end
contourf(deg,R,G,'edgecolor','none');
colormap('jet');
colorbar('Fontsize',10);
pbaspect([1 1 1]);
xlabel('degree','FontSize',15);
ylabel('반지름','FontSize',15);
title('핵생성 자유에어지');
xlim([0 90])
ylim([0 1e-6])