%% Variables File
% Cameron Maltman ES100 09/23/19
% Central file for variable storage
%% Environmental Variables
%converting psi to N/m^2 for calculations
psitoNm = 6894.7;
%pressure of the air at sea level in psi
Pair = 14.7;
%gravitational constant, m/s^2
g = 9.8;
%temperature in Kelvin at room temperature
Temp = 293;
%the gas constant which will be used in calculations ideal gas calcs
Rgas = 1.2509; %units are PSI, liters,grams,moles,and Kelvin
%% System Characteristics
%This variable represents the actual volume of both actuators when filled
%completely, the value is in liters for worst case
actuavol = 2;
%This variable represents the final pressure of each of the actuators and
%what we want them to be in psi for worst case
actuapres = 15;
%this variable represents the necessary time to go from 15 psi to the
%accumulator fill volume, this is the pneumatic recharge time
pneumrecharge = 10; 
%% Analyzing Flow Variables
% These values are for analyzing the flow through the system to determine
% how much pressure is lost over the course of the tubing
TubingOD = 3/8; %inches
TubingID = 0.00635; %m, 1/4 inches
AreaCS = 0.000127; %tubing cross sectional area in meters^2
MaxFlow = 30; %this is the absolute maximum flow rate for all relevant cases, L/min, confirmed by a 1 second exhaust calculation
MaxFlowCalc = 30/(1000*60); %maximum flow conditions in m^3/s
KinVisc = 15.06*10^(-6); %kinematic viscosity of air m^2/s
MaxL = 1; %m, this is the maximum length of the tubing we are dealing with

%% Loss Through Pneumatic Valves
SG = 1; %the specific gravity of air
MaxFlowImp = MaxFlowCalc * 127133; %calculating the imperial flow rate in ft^3/hour
Pin = 49.7; %approximate inlet pressure in worst case, absolute, 1.5L accumulator
Pout = Pair; %lowest pressure of actuators in absolute pressure
TempRank = 527.67; %room temperature in rankine
Cv = 0.2; %flow coefficient as stated in the data sheet of some valves
%% Pump Characteristics
dispVol = 0.00016; %L, the displaced volume by one upstroke of the piston
PistonA = pi*(0.01615^2); %the area of the diaphragm/piston in meters squared
OffAxisR = 0.00185; %this is the off-axis radius of rotation and relates to stroke length