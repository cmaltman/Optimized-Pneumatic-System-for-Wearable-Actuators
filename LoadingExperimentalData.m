%% Script for Loading MATLAB Data
% Cameron Maltman, 11/17/2019, Harvard Biodesign Lab

%% Loading in the data points into the workspace for a given experiment
%loading the data from one experiment into the workspace
folderdata = dir('C:\Users\camer\Desktop\Thesis\Experiment_Data\airpo35-022520');
%deleting the two empty fields that are part of the data
folderdata(1:2) = [];
%getting the file names from the struct
filenames = {folderdata.name}.';
%creating a variable to store the values from reading into the data
expvals = {};

%using a for loop to add to the experimental data set
for i = 1:length(folderdata)
    %creating an appended string to use for sourcing the data from the file
    filenameupdate = insertBefore(filenames(i), 1, 'C:\Users\camer\Desktop\Thesis\Experiment_Data\airpo35-022520\');
    %loading the restults file into the workspace
    results = load(string(filenameupdate(1)));
    %taking the pressure, flow, and unfiltered signals from the data, using
    %last ten seconds of data
    usefulvals = results.outputs(end-9999:end,:);
    %storing these values into an array
    expvals{i} = usefulvals;
end
%% Dealing with Data now that it is loaded in
%storing the data before I manipulate it
rawvals = expvals;
%taking out the first two data points as they only contain the raw non-pump
%data and aren't important, also the failure output
expvals(1) =  [];
expvals(1) =  [];
% this may not be necessary for every data manipulation, check the
% coresponding google sheet

%creating arrays to store my pressure, flow, and their standard errors
Pressure = [];
Flow = [];
%calculating error values incase they were needed
PressErr = [];
FlowErr = [];

for i = 1:length(expvals)
   %calculating the mean values and using those as the average flow and
   %pressure terms
   meanvals{i} = mean(expvals{i});
   Pressure = [Pressure, meanvals{i}(1)];
   Flow = [Flow,meanvals{i}(3)];
   %calculating the standard deviation on the data to plot error on my
   %plots
   errorvals{i} = std(expvals{i});
   PressErr = [PressErr,errorvals{i}(1)];
   FlowErr = [FlowErr,errorvals{i}(3)];
end

%Normalizing voltage for a 0Psi gauge pressure, you need to do this do the
%Bernoulli's equation causing there to be a gauge pressure that is measured
%in the flow that is lower than it actually is. This is the free flow
%pressure so the gauge should be zero
normalP = mean(rawvals{3});
%converting the pressure to a value in psi, the 5 comes from the supply
%voltage
PressureCalc = (Pressure-(normalP(1)))*((100)/(0.8*(5)));
%calculating the flow through the system in SLPM
FlowCalc = Flow*5 - 5;
%converting from SLPM to NLPM to get actual flow
FlowCalc = FlowCalc * (293.15/273.15)*(14.504/14.696);

%if you want to use the error values you need to do the same normalization
%of the data