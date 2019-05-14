close all
clear all
% load('shot_45994');
% load('shot_46023');
% load('shot_46037')
% load('shot_46045')
% load('shot_46237')
% load('shot_45994')
% load('shot_46076')
% load('shot_46093')
% load('shot_46241');
% load('shot_46000');
% load('shot_46008');
% load('shot_46235');
load('shot_46226');

time1=1e-3*data.time;

figure()
plot(time1,data.Ip_magn)
grid on
return
%% Select time window
index1=find(time1 ==79.8);
index2=find(time1 == 103.8);

Ip=data.Ip_magn(index1:index2);
I_prim=data.prim(index1:index2);
I_hor=data.hor(index1:index2);
I_vert=data.vert(index1:index2);
Rc=data.R0(index1:index2);
Zc=data.z0(index1:index2);
time=time1(index1:index2);


%% Convert to double
ISTTOK.Ip=double(Ip);
ISTTOK.I_prim=double(I_prim);
ISTTOK.I_hor=double(I_hor);
ISTTOK.I_vert=double(I_vert);
ISTTOK.Rc=double(Rc);
ISTTOK.Zc=double(Zc);
ISTTOK.time=double(time);


%%
% inputs=[ISTTOK.I_prim,ISTTOK.I_vert,ISTTOK.I_hor];
inputs=[ISTTOK.I_vert,ISTTOK.I_hor];
outputs=[ ISTTOK.Rc,ISTTOK.Zc];
Ts=100e-6;
exp10=iddata(outputs,inputs,Ts);

%% Filter the position
Rc_fil=lowpass(ISTTOK.Rc,1000,1/Ts);
Zc_fil=lowpass(ISTTOK.Zc,1000,1/Ts);

outputs1=[ Rc_fil,Zc_fil];

exp6=iddata(outputs1,inputs,Ts);
