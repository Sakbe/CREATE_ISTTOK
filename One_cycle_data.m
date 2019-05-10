close all
clear all
% % load('shot_45994');
% load('shot_46023');
% load('shot_46037')
% load('shot_46045')
% load('shot_46061')
 load('shot_45994')
 data1=data;
% load('shot_46076')
load('shot_46093')
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
%%%%%% 46020
%54.2
%80.2
%%%% 46019
%32.8
%58.7
%%% 46023
%52.9
%78.8
%%%% 46037
%336.3
%360.7
%%% 46076
%59.4
%85.3
%%% 46093
%877.9
%901.7


%% Ridhima shot 46093 inversion at the ned
%% 46091 inversion at the beggining


index1=find(time1 == 877.9);
index2=find(time1 == 955.1);

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
ident

%%
inputs=[ISTTOK.I_prim,ISTTOK.I_vert,ISTTOK.I_hor];
outputs=[ ISTTOK.Rc,ISTTOK.Zc];



inputs1=[ISTTOK.I_vert,ISTTOK.I_hor];
outputs1=[ISTTOK.Rc,ISTTOK.Zc];


inputs2=[ISTTOK.I_vert,ISTTOK.I_hor];
outputs2=[ISTTOK.Rc];


inputs3=[ISTTOK.I_vert];
outputs3=[ISTTOK.Rc];

%% interpolate position
j=0;
for i=1:length(time)
if(ISTTOK.Ip(i) < 750 & ISTTOK.Ip(i) > -750)
    j=j+1;
    indexes(j)=i;
else
end   
end
%%%    240   241   242   243   244   245   246   508   509   510   511   512   513   514
interp1([time(239),time(247)],[ISTTOK.Rc(239),ISTTOK.Rc(247)],time(239:247),'spline')



%%%
% for i=1:12
% plot(time,Bsens(i,:))
% hold on
% grid on
% end
subplot(3,1,1)
plot(time, ISTTOK.Ip)
grid on
subplot(3,1,2)
plot(time,ISTTOK.Rc)
grid on
subplot(3,1,3)
plot(time,ISTTOK.Zc)
grid on
hold on