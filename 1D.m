clc; clear; close all;

D=4e-11; %확산계수
L=2.5e-4; %철강의 길이
C0=0.1 %초기농도
Cs=0.2 %표면농도
dx=L/100; %바 쪼개기
x=[0:dx:L];
im=numel(x); %x의 개수
alp=0.9;
dt=(dx)^2/(2*D)*alp;

%initial
for i=1:im
    Cnew(i)=C0;
end
Cnew(1)=Cs;

realT=0;
for t=1:200;
    realT=realT+dt; %실제시간
    Cold=Cnew; %Cold 로 복사,updata
    Cold(1)=Cs;
    Cold(im)=C0;
    for i=2:im-1
        Cnew(i)=D*dt/(dx)^2*(Cold(i+1)-2*Cold(i)+Cold(i-1))+Cold(i);
        %C0=Cold(i);
        %C1=Cold(i+1);
        %C2=Cold(i-1);
        %dC-dx=C1-2*C0+C2;
        %Cnew(i)=(D*dt/dx^2)*dC_dx+C0;
    end
end

%실제 해 계산
for i=1:im
    Creal(i)=Cs-(Cs-C0)*erf(x(i)/(2/sqrt(D*realT)));
end

hold on;
plot(x,Cold,'o');
plot(x,Cold);

%10주차 9페이지