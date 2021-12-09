clc; clear; close all

num = ones(1,3);
den = ones(1,3);

samplet = 0.1;
step = 15;

out = sim('sensores_cod_testing.slx');
COD = out.SCOD(:,3);
COD = COD(step/samplet:end);
tiempo = out.SCOD(:,1);
tiempo = tiempo(step/samplet:end);

F = out.SCOD(:,2);
F = F(step/samplet:end);

datos = iddata(COD, F, samplet);

sys1 = tfest(datos,1,0);
[num den] = tfdata(sys1); 

num = cell2mat(num);
den = cell2mat(den);