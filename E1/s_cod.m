tiempo = out.SCOD(:,1);
sinusoidal = out.SCOD(:,2);
aqua = out.SCOD(:,3);
realtech = out.SCOD(:,4);
proteus = out.SCOD(:,5);

plot(tiempo,sinusoidal)
xlabel('Tiempo (s)')
ylabel('COD (mg/L)')
grid on
hold on
plot(tiempo,aqua)
plot(tiempo,realtech)
plot(tiempo,proteus)
legend('Sinusoidal','Aqua','Realtech','Proteus')
hold off