%% Storing Data Points
% take the outputs and time data from the test log
outputs = tg.OutputLog;
time = tg.TimeLog;
%saving to a specific file for use later
save('actuatordischargetest5','outputs','time')