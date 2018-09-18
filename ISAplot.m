clear all
close all
clc
%% code description:
%lab 1 
% this is a code that calls a function ISAfunction to solve for atmospheric
% properties at various altitudes and display the results in a plot

%% authors
% Rohith Prem Maben(rohma417)
%Yuvarajendra Anjaneya Reddy(yuvan983)

%% constants for ICAO atmospheric calculator

g=9.81  % ac du to graity m/s2
gamma=1.4 %ratio of specific heat  
rho0=1.225 %kg/m3
P0=101325 % newton/m2
T0=288.15 %kelvin temperature at sea level
mu0=1.789*10.^-5 % viscoisty at Sea level
R=287 % gas constant
a0=340.294 % speed of sound at sea level
%% lapse rate in K/km 
B1=-6.5       %0-11 km
B2=0          %11-20 km
B3=1          %20-32
B4=2.8        %32-47
B5=0          %47-51
B6=-2.8       %51-71
B7=-2         %86-71



%% input geometric altitude(km)
z=0:86

z_ft=0:1000:86000%altitude in ft


%% calling main atmospheric function


[mu,T,a,P_pa,rho]= ISAfunction(z,T0,B1,B2,B3,B4,B5,B6,B7,gamma,R,P0,g)


%% output ratios
mu_ratio=mu*mu0.^-1
T_ratio=T*T0.^-1
a_ratio=a*a0.^-1
P_ratio=P_pa*P0.^-1
z_km=z*0.001
rho_ratio=rho*rho0.^-1

%% plot parameters
figure
plot(T_ratio,z,P_ratio,z,rho_ratio,z,a_ratio,z,mu_ratio,z);
grid on 
ylim([0 86])
xlim([0 1.2])
set(gca,'fontsize',12)
%axis([... ... ... ...]);
xlabel('T/T_{0} , P/P_{0} , \rho/\rho_{0} , a/a_{0} , \mu/\mu_{0} [-]');
ylabel('Z [km]');
title('ICAO atmosphere calculator')
legend('T/T_{0}', 'P/P_{0}', '\rho/\rho_{0}', 'a/a_{0}', '\mu/\mu_{0}', 'Location', 'NorthWest');
grid on 
%grid minor
%grid major
print('ISA plot', '-dpng', '-r300'); % Save as PNG with 300 DPI

