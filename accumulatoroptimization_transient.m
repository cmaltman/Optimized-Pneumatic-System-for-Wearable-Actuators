%% Accumulator Optimization Script
% Cameron Maltman 10/21/19
% this script is very similar to the accumulator optimization code but
% outputs the transients values within the numerical solver

%% Curve-fitting and Plotting
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
tests = 1;
%This variable represents the final pressure of each of the actuators and
%what we want them to be in psi, absolute so addi 15psi
actuapresabs = actuapres+Pair;
%Setting a matrix that holds all of the different accumulator volumes that
%will be tested
accumvol = 1;
%creating a coresponding matrix for the pressure which is related to all of
%the values above, using the function in this same file. This value is in
%absolute psi. Adding a safety factor of 5% as noted by the vacuum,
%pressure handbook, as well a look at different experimental test results
accumpres = 1.05.*accumulatorpressure(accumvol,actuavol,actuapresabs,Pair);
%% Running my Optimization Code

%values taken for a specific accumulator optimization, informed by
%accumulator optimization code
n = 22715;

%creating a value to hold the pressure and time of the system
pressurelist = zeros(1,n);
timelist = zeros(1,n);

%creating the nested for loops that will calculate these terms
for i = 1:tests
    %getting the testing volume out of the goal value
    testvolume = accumvol;
    %getting the test pressure out of the goal value this value
    %is an absolute value
    testpressure = accumpres;
    %getting the number of moles of air in the accumulator at the start and
    %track throughout. assuming that it is the pressure of the actuator as
    %it shouldn't go lower than that
    molesaccum = (actuapresabs.*testvolume)/(Rgas*Temp);
    %setting the accumulator pressure to start at actuator pressure wanted
    %as that is the steady state case. This is an absolute value
    pbag = actuapresabs;
    %creating a total time counter for each run through the loop
    timetot = 0;
    %creating another counter
    m = 1;
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
        % adds values to the lists and then adds up to the counter
        timelist(m) = timetot;
        pressurelist(m) = pbag;
        m = m + 1;
    end
    pressurelist = pressurelist - Pair;
end