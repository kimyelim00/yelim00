clc; clear; close all;
dGv=1e6; % 단위부피당구동력변화
gam0=0.3; % 단위면적당계면에너지
alpha=0.2;
R=[0:1e-8:1e-6]; % R의반지름0~1e-6까지1e-9간격으로데이터생성
degree=[0:1:90];
imax=numel(R); % R의데이터의수를imax로저장
dmax=numel(degree);
for i=1:imax
for j=1:dmax
radian=degree(j)*pi/180;
gam=gam0*( 1+alpha*cos(4*radian) );
vol(i)=pi*R(i)^2*-dGv;
inter(i,j)=2*pi*R(i)*gam;
dG(i,j)=vol(i)+inter(i,j);
end
end
hold on;
contourf(degree,R,dG,100,'edgecolor','none');
%contourf(R,degree,dG',100,'edgecolor','none');
%contourf(dG);
%contourf(dG,100);
%contourf(dG,100,'edgecolor','none');
colormap(jet);
%axis off;
colorbar('FontSize',10);
xlabel('Degree','fontsize',20);
ylabel('반지름(m)','fontsize',20);
title('핵생성시자유에너지변화','fontsize',20);
pbaspect([1 1 1]);
%xlim([0 90]);
%ylim([0 1e-6]);