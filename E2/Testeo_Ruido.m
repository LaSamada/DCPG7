clc; clear; close all
out = sim('Lazoabierto_ruido_2021r.slx');

cod = out.simout(:,1);
%tiempocod = out.simout(:,2);
%plot(tiempocod,cod,'g','LineWidth',1)
%grid on
%xlabel('Tiempo (d)')
%ylabel('COD (g/L)')
%title('Lazo Abierto con pertubación')

tr1 = out.simout1(:,1);
tiempotr1 = out.simout1(:,2);
%plot(tiempotr1,tr1,'g','LineWidth',1)
%grid on
%xlabel('Tiempo (d)')
%ylabel('Temp Reactor Acidogénico (°C)')
%title('Lazo Abierto con pertubación')

tr2 = out.simout2(:,1);
tiempotr2 = out.simout2(:,2);
%plot(tiempotr2,tr2,'g','LineWidth',1)
%grid on
%xlabel('Tiempo (d)')
%ylabel('Temp Reactor Metanogénico (°C)')
%title('Lazo Abierto con pertubación')

codsin = out.simout3(:,1);
tiempocodsin = out.simout3(:,2);
plot(tiempocodsin,codsin,'g','LineWidth',1)
grid on
xlabel('Tiempo (d)')
ylabel(' COD(g/L)')
title('Lazo Abierto sin pertubación')