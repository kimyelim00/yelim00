clc; clear; close all;

deg=[0:1:360];
im=numel(deg);
gam0=0.3;
alp=0.2;

for i=1:im
    rad=deg(i)/180*pi;
    gam(i)=gam0*(1+alp*cos(4*rad));
end

plot(deg,gam,"k");
xlim([0 360])
