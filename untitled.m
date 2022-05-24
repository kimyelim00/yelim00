clc; clear; close all;

x=[-1:0.01:1]
xm=numel(x);

for i=1:xm
    y1(i)=sqrt(1-x(i)^2);
    y2(i)=-sqrt(1-x(i)^2);
end
hold on;
plot(x,y1,"k");
plot(x,y2,"k");
pbaspect([1 1 1])

i=-1; j=-1; k=-1;
v=[i j k]
norm=sqrt(i^2+j^2+k^2);
v=v/norm

X=v(1)/(1-v(3));
Y=v(2)/(1-v(3));
plot(X,Y,'*-b')