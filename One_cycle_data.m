close all
clear all
load('shot_45988');

time1=1e-3*data.time;
%60.9
%86.9
%87.7
%113.5
%114.2
%140.1
%140.9
%166.9
%%%%% 45994
%59
%84.7
%85.7
%111.5
%112.2
%138.1
%138.8
%164.6

index1=find(time1 == 140.9);
index2=find(time1 == 166.9);

Ip=data.Ip_magn(index1:index2);
I_prim=data.prim(index1:index2);
I_hor=data.hor(index1:index2);
I_vert=data.vert(index1:index2);
Rc=data.R0(index1:index2);
Zc=data.z0(index1:index2);
Bsens=data.mirnv_corr(:,(index1:index2))/(50*49e-6);
 Bsens(10,:)=Bsens(10,:)*1.2803;
time=time1(index1:index2)-108.7;

ISTTOK.Ip=double(Ip);
ISTTOK.I_prim=double(I_prim);
ISTTOK.I_hor=double(I_hor);
ISTTOK.I_vert=double(I_vert);
ISTTOK.Rc=double(Rc);
ISTTOK.Zc=double(Zc);
ISTTOK.Bsens=double(Bsens);
ISTTOK.time=double(time);

inputs=[ISTTOK.I_prim,ISTTOK.I_vert,ISTTOK.I_hor];
outputs=[ISTTOK.Ip, ISTTOK.Rc,ISTTOK.Zc];



inputs1=[ISTTOK.I_vert,ISTTOK.I_hor];
outputs1=[ISTTOK.Rc,ISTTOK.Zc];

% for i=1:12
% plot(time,Bsens(i,:))
% hold on
% grid on
% end

plot(time, ISTTOK.Ip)
hold on