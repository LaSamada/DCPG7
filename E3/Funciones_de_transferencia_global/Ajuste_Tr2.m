clc; clear; close all

num = ones(1,3);
den = ones(1,3);

samplet = 0.1;
step = 150;

out = sim('Lazo_abierto_E3.slx');

Tr2 = out.simout(:,1);
Tr2 = Tr2(step/samplet:end);
tiempoTr2 = out.simout(:,3);
tiempoTr2 = tiempoTr2(step/samplet:end);

FTr2 = out.simout(:,2);
FTr2 = FTr2(step/samplet:end);

datosTr2 = iddata(Tr2, FTr2, samplet);

sys3 = tfest(datosTr2,1,0);

[nun dem] = tfdata(sys3); 

num = cell2mat(nun);
den = cell2mat(dem);

