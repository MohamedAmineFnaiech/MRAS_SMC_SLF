clear all;
clc;
%Type of machine INDUKTA FSLg 132S-4
%Pn=5500;nominal power
%Nn=1450; nominal speed
%In=11;nominal current
%nominal torque
V=400*sqrt(2)/sqrt(3);
Npole=2;
fs=50;
Tsim=0.5e-5;
Rs=4.74;
Rr=4.75;
M=0.3032;
Lm=0.3032;
Llr=0.01689;
Lls=0.01689;
%Jm=0.0038*2;
F=1e-6;
Ls=Lm+Llr;
Lr=Lm+Lls;
sig=1-((M^2)/(Ls*Lr));
Tr=Lr/Rr;
Tss=Ls/Rs;
Jm=0.076;%%%old one 0.029 new one is 0.076 
F=1e-20;
T3_2=sqrt(2/3)*[cos(0) cos(2*pi/3) cos(4*pi/3);sin(0) sin(2*pi/3) sin(4*pi/3)];
T2_3=T3_2';
phid=1.24;
%current controller
Toid=0.001;
Gi=Lr^2/(Rs*Lr^2+Rr*M^2);
Toi=sig*Ls*Lr^2/(Rs*Lr^2+Rr*M^2);
Kpc=Toi/Toid/Gi;
Kic=1/Toid/Gi;
%flux controller
Tofd=0.001;
Gf=Lm;
Tof=Tr;
Kpf=Tr/Tofd/Gf;
Kif=1/Tofd/Gf;
%speed controller
Tood=0.001;
Go=Npole*M*phid/F/Lr;
Too=Jm/F;
Kpo=Too/Tood/Go;
Kio=1/Tood/Go;
%MRAS_PI
Tomd=0.0001;
Gm=phid^2;
Tom=Tr;
Kpm=Tom/Tomd/Gm;
Kim=1/Tomd/Gm;


