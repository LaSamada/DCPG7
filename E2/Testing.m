% A1 = 0.3e4;
% A2 = 0.7e10;
% R = 8.314;
% E1 = 5800;
% E2 = 4.9e4;
% D = 0;
% 
% mu = @(Tr) ((A1 * exp(-E1/(R * (Tr + 273 + D)))) - (A2 * exp(-E2/(R * (Tr + 273 + D)))));
% fplot(mu, [-140 80])

A1 = 7e3;
A2 = 1e10;
R = 8.314;
E1 = 5300;
E2 = 5.15e4;
D = 0;

mu = @(Tr) ((A1 * exp(-E1/(R * (Tr + 273 + D)))) - (A2 * exp(-E2/(R * (Tr + 273 + D)))))/951.811;
fplot(mu, [-200 119])
%%
syms Tr D
mu = (A1 * exp(-E1/(R * (Tr + 273 + D)))) - (A2 * exp(-E2/(R * (Tr + 273 + D))));
a = diff(mu, Tr);

vpasolve(subs(mu, Tr, 37) == 0, D, 350)