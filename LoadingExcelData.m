%% Loading Excel Data
% Cameron Maltman, 11/26/19, Harvard Biodesign Lab

%% Setup the Import Options
opts = spreadsheetImportOptions("NumVariables", 3);

% Specify sheet and range
opts.Sheet = "Sheet1";
opts.DataRange = "A2:C14";

% Specify column names and types
opts.VariableNames = ["VoltageReadoutforMotorv", "AmperageReadoutfromPowerSupplyformotorA", "DecibelleveldB2ftaway"];
opts.SelectedVariableNames = ["VoltageReadoutforMotorv", "AmperageReadoutfromPowerSupplyformotorA", "DecibelleveldB2ftaway"];
opts.VariableTypes = ["double", "double", "double"];

% Import the data
exceldata = readtable("C:\Users\camer\Desktop\Thesis\Experiment_Data\ExcelFiles\NPK24v_01_16_20", opts, "UseExcel", false);

%take out empty indices in the array
exceldata=exceldata(~any(ismissing(exceldata),2),:);
% useful exceldata, taking out the first two useless data points
NPK24Excel = table2array(exceldata(3:end,1:3));
%power3 = usefulexcel(:,1).*usefulexcel(:,2)
%% Clear temporary variables
clear opts