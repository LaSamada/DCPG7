
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
sizes.NumContStates  = 3;        % (Biomass, Lactose, Tagatosa, T, H, pH) 
sizes.NumDiscStates  = 0;  
sizes.NumOutputs     = 3;        % (Biomass, Lactose, Tagatosa, T, H, pH) 
sizes.NumInputs      = 1;        % (Tchaqueta, Fchaqueta, Fbase, COHb)
sizes.DirFeedthrough = 0; 
sizes.NumSampleTimes = 1; 
sys = simsizes(sizes);
str = []; 
ts = [0 0];
x0 = [100 100 100];     % Initial conditions

function sys = mdlDerivatives(~,x,u)
% State variables
x1   =  x(1);                % Biomass,          [mol/L]
x2   =  x(2);                % Lactose,          [mol/L]
x3   =  x(3);

% Input variables
u   = u(1);                % Tchaqueta,        [°C]

% Model parameters
alfa = 0.13;                % Volume,           [L]
mu1   = 0.27;                % Area,             [m^2]
ks1 = 24;                % Density,          [kg/L]
beta  = 1.9527;                % Cp,               [kJ/(kg*°C)]
k2k1 = 3.5;                % Cpr,              [kJ/(kg*°C)]
xi2 = 27;
xi3 = 50;

%  Differential equations
sys(1) = -beta * u * alfa * x1 + ((mu1 * x2)/(ks1 + x2)) * x1;                
sys(2) = beta * u * (xi2 - x2) - ((mu1 * x2)/(ks1 + x2)) * x1;           
sys(3) = beta * u * (xi3 - x3) + (k2k1) * ((mu1 * x2)/(ks1 + x2)) * x1;

function sys = mdlOutputs(~,x,~)
sys = [x(1) x(2) x(3)];                         