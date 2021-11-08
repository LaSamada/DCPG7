clc; clear; close all

num = ones(1,3);
den = ones(1,3);

samplet = 0.1;
step = 150;

out = sim('lazo_abierto.slx');
COD = out.simout(:,1);
COD = COD(step/samplet:end);
tiempo = out.simout(:,2);
tiempo = tiempo(step/samplet:end);

Tr1 = out.simout1(:,1);
Tr1 = Tr1(step/samplet:end);
tiempoTr1 = out.simout1(:,2);
tiempoTr1 = tiempoTr1(step/samplet:end);

Tr2 = out.simout2(:,1);
Tr2 = Tr2(step/samplet:end);
tiempoTr2 = out.simout2(:,2);
tiempoTr2 = tiempoTr2(step/samplet:end);

F = out.input1;
F = F(step/samplet:end);

FTr1 = out.input2;
FTr1 = FTr1(step/samplet:end);

FTr2 = out.input3;
FTr2 = FTr2(step/samplet:end);

datos = iddata(COD, F, samplet);
datosTr1 = iddata(Tr1, FTr1, samplet);
datosTr2 = iddata(Tr2, FTr2, samplet);


sys1 = tfest(datos,2,1);
sys2 = tfest(datosTr1,1,0);
sys3 = tfest(datosTr2,1,0);
[nun dem] = tfdata(sys3); 

num = cell2mat(nun);
den = cell2mat(dem);

CODtrans = out.simout(:,3);
CODtrans = CODtrans(step/samplet:end);

% plot(tiempo,COD, 'r',tiempo, CODtrans,'--b','LineWidth',1);
% grid on
% xlabel('Tiempo (d)')
% ylabel('COD (g/L)')
% legend('Proceso','F. Trans')
% title('Ajuste COD')
% ylim([0.8 1.6])
% xlim([140 250])

Tr1trans = out.simout1(:,3);
Tr1trans = Tr1trans(step/samplet:end);

% plot(tiempoTr1,Tr1, 'r',tiempoTr1,Tr1trans, '--b','LineWidth',1);
% grid on
% xlabel('Tiempo (d)')
% ylabel('Temp Reactor Acidogénico (°C)')
% legend('Proceso','F. Trans')
% title('Ajuste Temp Reactor Acidogénico')
% ylim([-3.25 -3.1])
% xlim([148 160])

Tr2trans = out.simout2(:,3);
Tr2trans = Tr2trans(step/samplet:end);

plot(tiempoTr2,Tr2,'r',tiempoTr2,Tr2trans,'--b','LineWidth',1);
grid on
xlabel('Tiempo (d)')
ylabel('Temp Reactor Metanogénico (°C)')
legend('Proceso','F. Trans')
title('Ajuste Temp Reactor Metanogénico')
ylim([-1.32 -1.24])
xlim([148 170])
