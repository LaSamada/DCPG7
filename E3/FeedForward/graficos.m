out = sim('Lazo_cerrad_E3_PID_FF.slx');
temp = out.tr1_xd(:,2);
c = out.tr1_xd(:,1);
t = out.tr1_xd(:,3);

plot(t,temp,'r-',t,c,'b--','Linewidth',0.8)
grid("on")
xlabel('Tiempo (d)')
ylabel('Temperatura (°C)')
ylim([30 42])
legend('Temperatura', 'Referencia')

temp2 = out.tr2_xd(:,1);
c2 = out.tr2_xd(:,2);
t2 = out.tr2_xd(:,3);

plot(t2,temp2,'r-',t2,c2,'b--','Linewidth',0.8)
grid("on")
xlabel('Tiempo (d)')
ylabel('COD (gr/L)')
ylim([-1 10])
legend('COD', 'Referencia')