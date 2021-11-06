function [sys, x0,str,ts] = sFunction_meta(t,x,u,flag)
switch flag
   case 0
   [sys,x0,str,ts] = mdlInitializeSizes;
   case 1 
   sys = mdlDerivatives(t,x,u);
   case 3
   sys = mdlOutputs(t,x,u);
   case {2,4,9}
   sys=[];
   otherwise
   error(['Unhandled flag = ',num2str(flag)]);
end

function [sys,x0,str,ts] = mdlInitializeSizes
sizes=simsizes;
sizes.NumContStates  = 6;        % (Biomass, Lactose, Tagatosa, T, H, pH) 
sizes.NumDiscStates  = 0;  
sizes.NumOutputs     = 6;        % (Biomass, Lactose, Tagatosa, T, H, pH) 
sizes.NumInputs      = 6;        % (Tchaqueta, Fchaqueta, Fbase, COHb)
sizes.DirFeedthrough = 0; 
sizes.NumSampleTimes = 1; 
sys = simsizes(sizes);
str = []; 
ts = [0 0];
x0 = [23.2 100 10 30];     % Initial conditions

function sys = mdlDerivatives(~,x,u)
% State variables
x4   =  x(1);                % Biomass,          [mol/L]
x5   =  x(2);                % Lactose,          [mol/L]
x6   =  x(3);
x7   =  x(4);
Tr   =  x(5);                % Biomass,          [mol/L]
Tj   =  x(6);

% Input variables
U  = u(1);                % Tchaqueta,        [°C]
x2 = u(2);
x3 = u(3);
Fj = u(4);
Tjin = u(5);
Tin = u(6);

% Model parameters
alfa2 = 0.38;                % Volume,           [L]
mu12   = 0.5;                % Area,             [m^2]
mu22 = 0.29;
ks12 = 3.5;                % Density,          [kg/L]
ks22  = 16;                % Cp,               [kJ/(kg*°C)]
k5k3 = 0.9;
%Energia
mu = ((mu1 * x2)/(ks1 + x2)) * (7e3 * exp(-(5300/(8.314 * ...
    (Tr + 273))))) - (1e10 * exp(-5.15e4 / (8.314 * (Tr + 273)))); %?
D = 0.164; %1/d
Kt = 500 * 24 * 3600; %j/d m2 C
At = 3 * 0.078 * 2 * pi * 0.078; %m2
rhor = 1000; %kg/m3
Cheatr = 4.186; %j/kgC
Cheatj = 4.186; %j/kgC
rhoj = 1000; %kg/m3
Vj = 0.004; %m3
V = 0.008; %m3
dHr = -443920 * 1000 / 88; %j/mol

%  Differential equations
sys(1) = -U*alfa2*x4 + ((mu12*x6)/(ks12+x6))*x4;                
sys(2) = -U*alfa2*x5 + ((mu22*x7)/(ks22+x7))*x5;         
sys(3) = U*(x2-x6) - ((mu12*x6)/(ks12+x6))*x4;
sys(4) = U*(x3-x7) - ((mu22*x7)/(ks22+x7+(x7/ks12)^2))*x5 + (k5k3)*((mu12*x6)/(ks12+x6))*x4;
sys(5) = D * (Tin - Tr) + ((mu * x2 * dHr)/(32 * rhor * Cheatr)) - ...
    ((Kt * At * (Tr - Tj))/(V * rhor *Cheatr));               
sys(6) = (Fj/Vj) * (Tjin - Tj) + ((Kt * At *...
    (Tr -Tj))/(Vj * rhoj * Cheatj));


function sys = mdlOutputs(~,x,~)
sys = [x(1) x(2) x(3) x(4) x(5) x(6)];