tiempo = out.STemp(:,1);
Step = out.STemp(:,2);
YSL_PRO = out.STemp(:,3);
FL_TF = out.STemp(:,4);
analog = out.STemp(:,5);

grafico1 = tiledlayout(3,1);
nexttile
plot(tiempo,YSL_PRO,'c')
xlabel('Tiempo (s)')
ylabel('Temperatura (°C)')
ylim([35,40])
xlim([4,6])
hold on
plot(tiempo,Step,'k')
legend('YSL PRO','Referencia')
grid on
hold off

nexttile
plot(tiempo,FL_TF,'g')
xlabel('Tiempo (s)')
ylabel('Temperatura (°C)')
hold on
ylim([35,40])
xlim([4,6])
plot(tiempo,Step,'k')
legend('FL TF','Referencia')
grid on
hold off

nexttile
plot(tiempo,analog,'m')
xlabel('Tiempo (s)')
ylabel('Temperatura (°C)')
hold on
ylim([35,40])
xlim([4,6])
plot(tiempo,Step,'k')
legend('Analog Devices','Referencia')
grid on
hold off

