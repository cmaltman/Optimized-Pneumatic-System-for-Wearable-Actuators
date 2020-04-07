%% Plotting Excel Data
% Cameron Maltman, 02/01/20
% This is a sample code for plotting the excel data in MATLAB
%% Plotting the Data
figure(1)
a = plot(PressureCalc,NPK24Excel(:,3),'r')
set(gca,'FontSize',20)
set(a,'LineWidth',3)
hold on
b = plot(PressureCalc,NPKInsertExcel(:,3),'b')
c = plot(PressureCalc,NPKMuffledExcel(:,3),'g')
d = plot(PressureCalc,NPKTubingExcel(:,3),'k')
set(b, 'LineWidth',3)
set(c, 'LineWidth',3)
set(d, 'LineWidth',3)
xlabel('Pressure (psi)')
ylabel('Noise(dB)')
title('Decibel Levels for Different Pump Muffling Techniques')
legend('NPK 24V Pump, unmuffled','NPK 24V Pump, smaller intlet diameter','NPK 24V, muffler added','NPK 24V, added inlet length')
hold off