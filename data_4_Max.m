close all
clear all
load('shot_45990');

time1=1e-3*data.time;
index1=find(time1 == 108.7);
index2=find(time1 == 135.3);

Ip=data.Ip_magn(index1:index2);
I_prim=data.prim(index1:index2);
I_hor=data.hor(index1:index2);
I_vert=data.vert(index1:index2);
Rc=data.R0(index1:index2);
Zc=data.z0(index1:index2);
Bsens=data.mirnv_corr(:,(index1:index2))/(50*49e-6);
 Bsens(10,:)=Bsens(10,:)*1.2803;
time=time1(index1:index2)-108.7;

ISTTOK.Ip=Ip;
ISTTOK.I_prim=I_prim;
ISTTOK.I_hor=I_hor;
ISTTOK.I_vert=I_vert;
ISTTOK.Rc=Rc;
ISTTOK.Zc=Zc;
ISTTOK.Bsens=Bsens;
ISTTOK.time=time;

for i=1:12
plot(time,Bsens(i,:))
hold on
grid on
end