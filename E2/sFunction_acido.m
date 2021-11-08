function [sys, x0,str,ts] = sFunction_acido(t,x,u,flag)
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
sizes.NumContStates  = 5;        % (Biomass, Lactose, Tagatosa, T, H, pH) 
sizes.NumDiscStates  = 0;  
sizes.NumOutputs     = 6;        % (Biomass, Lactose, Tagatosa, T, H, pH) 
sizes.NumInputs      = 3;        % (Tchaqueta, Fchaqueta, Fbase, COHb)
sizes.DirFeedthrough = 1; 
sizes.NumSampleTimes = 1; 
sys = simsizes(sizes);
str = []; 
ts = [0 0];
x0 = [94.79 27 50 25 25];     % Initial conditions

function sys = mdlDerivatives(~,x,u)
% State variables
x1   =  x(1);                % Biomass,          [mol/L]
x2   =  x(2);                % Lactose,          [mol/L]
x3   =  x(3);
Tr   =  x(4);                % Biomass,          [mol/L]
Tj   =  x(5);

% Input variables
U   = u(1);                % Tchaqueta,        [°C]
Fj = u(2);
Tjin = u(3);

% Model parameters
alfa = 0.13;                % Volume,           [L]
mu1   = 0.27;                % Area,             [m^2]
ks1 = 24;                % Density,          [kg/L]
beta  = 1.9527;                % Cp,               [kJ/(kg*°C)]
k2k1 = 3.5;                % Cpr,              [kJ/(kg*°C)]
xi2 = 27;
xi3 = 50;
%Energia
mu = ((mu1 * x2)/(ks1 + x2)) * (((0.3e4 * exp(-(5800/(8.314 * (Tr + 273))))) - (0.7e10 * exp(-4.9e4 / (8.314 * (Tr + 273)))))/277.344); %?
Kt = 500 * 24 * 3600; %j/d m2 C
At = 3 * 0.078 * 2 * pi * 0.078; %m2
rhor = 1000; %kg/m3
Cheatr = 4.186; %j/kgC
Cheatj = 4.186; %j/kgC
rhoj = 1000; %kg/m3
Vj = 0.004; %m3
V = 0.0045; %m3
Tin = 25;
dHr = -44392 * 1000 / 88; %j/kg

%  Differential equations
sys(1) = -beta * U * alfa * x1 + mu * x1;                
sys(2) = beta * U * (xi2 - x2) - mu * x1;           
sys(3) = beta * U * (xi3 - x3) + (k2k1) * mu * x1;
sys(4) = beta * U * (Tin - Tr) - ((mu * x1 * dHr)/(32 * rhor * Cheatr)) - ((Kt * At * (Tr - Tj))/(V * rhor *Cheatr));               
sys(5) = (Fj/Vj) * (Tjin - Tj) + ((Kt * At * (Tr -Tj))/(Vj * rhoj * Cheatj));

function sys = mdlOutputs(~,x,u)

sys = [u(1) x(1) x(2) x(3) x(4) x(5)];                         