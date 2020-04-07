%% Plotting Pressure, Flow Curve
%Cameron Maltman, 02/01/20
% This is a sample code for plotting the data in MATLAB
%% Fitting the Curves
%[POut,FOut] = prepareCurveData(PressureCalc,FlowCalc);
%running fit function
%airpo15000 = fit(POut,FOut,'poly1');
%% Comparing the Curves
figure(1)
plot(airpo12v(2,:),airpo12v(1,:),'o')
hold on
plot(airpo15000(2,:),airpo15000(1,:),'o')
plot(airpo30000(2,:),airpo30000(1,:),'o')
plot(knf24v(2,:),knf24v(1,:),'o')
xlabel('Pressure (psi)')
ylabel('Flow Rate (NLPM)')
ylim([0,15])
title('Pressure-Flow Rate Curves for Different Pumps')
legend('12V Diaphragm Pump 4000RPM','12V Diaphragm Pump 15000RPM','12V Diaphragm Pump 30000RPM','24V Rocking Pump')
hold off

