clc; clear; close all

num = ones(1,3);
den = ones(1,3);

samplet = 0.1;
step = 150;

out = sim('Lazo_abierto_E3_troll.slx');

Tr1 = out.simout(:,2);
Tr1 = Tr1(step/samplet:end);
tiempoTr1 = out.simout(:,3);
tiempoTr1 = tiempoTr1(step/samplet:end);

FTr1 = out.simout(:,1);
FTr1 = FTr1(step/samplet:end);

datosTr1 = iddata(Tr1, FTr1, samplet);

sys2 = tfest(datosTr1,1,0);
[nun dem] = tfdata(sys2); 

num = cell2mat(nun);
den = cell2mat(dem);

