clc; clear; close all;

D=4e-11; %확산계수
L=0.1; %철강의 길이


dx=L/200; %바 쪼개기
x=[0:dx:L];
im=numel(x); %x의 개수 배열의 최댓값

dy=L/200;
y=[0:dy:L];
jm=numel(y);

alp=0.9;
dt=(dx)^2/(4*D)*alp;
Cnew=zeros(im,jm);
Cold=zeros(im,jm);

%initial
for i=1:im
for j=1:jm
    Cnew(i,j)=0;
    Cold=Cnew;

    if (i-im/2)^2+(j-jm)^2<=4;
        Cnew(i,j)=0.5;    
    end
end
end

realT=0;
for t=1:1000;
    realT=realT+dt
    Cold=Cnew; %updata
    %boundary condition
    for i=1:im
        Cold(i,1)=0;
        Cold(i,jm)=0;
    end
    for j=1:jm
        Cold(1,j)=0;
        Cold(im,j)=0;
    end
    %-----------
    for i=2:im-1
    for j=2:jm-1
        C0=Cold(i,j);
        C1=Cold(i+1,j);
        C2=Cold(i-1,j);
        C3=Cold(i,j+1);
        C4=Cold(i,j-1);
        dC_dx=C1-2*C0+C2;
        dC_dy=C3-2*C0+C4;
        Cnew(i,j)=(D*dt/(dx)^2)*(dC_dx+dC_dy)+C0;

    end
    end
end
contourf(x,y,Cold)
colorbar;

