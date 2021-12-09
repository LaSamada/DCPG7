clc; clear; close all

num = ones(1,3);
den = ones(1,3);

samplet = 0.1;
step = 150;

out = sim('Lazo_abierto_E3.slx');
COD = out.simout(:,2);
COD = COD(step/samplet:end);
tiempo = out.simout(:,1);
tiempo = tiempo(step/samplet:end);

F = out.simout(:,3);
F = F(step/samplet:end);

datos = iddata(COD, F, samplet);

sys1 = tfest(datos,2,1);
[nun dem] = tfdata(sys1); 

num = cell2mat(nun)
den = cell2mat(dem)

