tiempo = out.STemp(:,1);
Step = out.STemp(:,2);
YSL_PRO = out.STemp(:,3);
FL_TF = out.STemp(:,4);
analog = out.STemp(:,5);

grafico1 = tiledlayout(3,1);
nexttile
plot(tiempo,Step)
xlabel('Tiempo (s)')
ylabel('Temperatura (C°)')
hold on
plot(tiempo,YSL_PRO)
legend('Step','YSL PRO')
grid on
hold off

nexttile
plot(tiempo,Step)
xlabel('Tiempo (s)')
ylabel('Temperatura (C°)')
hold on
plot(tiempo,FL_TF)
legend('Step','FL TF')
grid on
hold off

nexttile
plot(tiempo,Step)
xlabel('Tiempo (s)')
ylabel('Temperatura (C°)')
hold on
plot(tiempo,analog)
legend('Step','Analog Devices')
grid on
hold off¿

