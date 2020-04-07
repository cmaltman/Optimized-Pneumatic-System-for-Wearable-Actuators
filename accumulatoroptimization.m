%% Accumulator Optimization Script
% Cameron Maltman 10/21/19
%% Curve-fitting and Plotting
% Using MATLAB functions to connect to the points and get a good equation
% of the system, fitting with a linear curve
%preparing data for curve fitting
[POut,FOut] = prepareCurveData(PressureCalc,FlowCalc);
%running fit function
[func,R] = fit(POut,FOut,'poly1');
%getting values for the a and b of the fit
Rsquare = R.rsquare;
FitVals = coeffvalues(func);
% ^calculating the r values for possible use later
%% Variable Declaration
%setting my time step value in seconds
deltaT = 0.001;
%setting the number of volume/pressure terms I am testing
tests = 50;
%This variable represents the final pressure of each of the actuators and
%what we want them to be in psi, absolute so addi 15psi
actuapresabs = actuapres+Pair;
%Setting a matrix that holds all of the different accumulator volumes that
%will be tested
accumvol = linspace(1,4,tests);
%creating a coresponding matrix for the pressure which is related to all of
%the values above, using the function in this same file. This value is in
%absolute psi. Adding a safety factor of 5% as noted by the vacuum,
%pressure handbook, corellates with experimental values.
accumpres = 1.05.*accumulatorpressure(accumvol,actuavol,actuapresabs,Pair);
%% Running my Optimization Code
% going to run this code to optimize over the volume of the accumulator

%creating a matrix that holds the time values for each of the different
%accumulator volumes to fill
timelist = zeros(1,tests);

%creating the nested for loops that will calculate these terms
for i = 1:tests
    %getting the testing volume out of the earlier created array
    testvolume = accumvol(i);
    %getting the test pressure out of the earlier created array, this value
    %is an absolute value
    testpressure = accumpres(i);
    %getting the number of moles of air in the accumulator at the start and
    %track throughout.
    molesaccum = (actuapresabs.*testvolume)/(Rgas*Temp);
    %setting the accumulator pressure to start at actuator pressure wanted
    %as that is the steady state case. This is an absolute value
    pbag = actuapresabs;
    %creating a total time counter for each run through the loop
    timetot = 0;
    %creating the while loop, safety factor is already considered with
    %above pressures, so is not accounted for here
    while pbag <= testpressure
        %calculating the flow into the accumulator, it uses gauge pressure
        %as one axis
        flow  = FitVals(2)+FitVals(1)*(pbag-Pair);
        %calculating the amount of air that has flowed into the accumulator
        %in liters
        unit = flow*(deltaT/60);
        %convert that value to moles inside the accumulator. Need to use
        % the outside pressure of the air as that is the NLPM value we get
        % it normalized to
        molesaccum = molesaccum + (unit*Pair)/(Rgas*Temp);
        %recalculating the values for the pressure inside of the
        %accumulator
        pbag = (molesaccum*Temp*Rgas)/testvolume;
        timetot = timetot + deltaT;
    end
    %storing the time it took at that specific instance
    timelist(i) = timetot;
end