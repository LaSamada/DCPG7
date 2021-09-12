%% Bomba LabV1
rpm_labv1 = out.LabV1(:,1);
f_labv1 = out.LabV1(:,2);
plot(rpm_labv1,f_labv1)
grid on
xlabel('RPM')
ylabel('Flujo (mL/min)')
legend('Bomba LabV1')
xlim([0 150])
ylim([0 2])
%% Bomba IF3 (refrigerante)
rpm_IF3 = out.IF3(:,1);
f_IF3 = out.IF3(:,2);
plot(rpm_IF3,f_IF3)
grid on
xlabel('RPM')
ylabel('Flujo (mL/min)')
legend('Bomba IF3')
xlim([0 350])
ylim([0 3500])

%% Bomba LabF1
rpm_LabF1 = out.LabF1(:,1);
f_LabF1 = out.LabF1(:,2);
plot(rpm_LabF1,f_LabF1)
grid on
xlabel('RPM')
ylabel('Flujo (mL/min)')
legend('Bomba LabF1')
xlim([0 150])
ylim([0 2])
