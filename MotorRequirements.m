%% Motor Requirements
% Cameron Maltman ES100 01/10/2020
%% Description
% This document is for calculating and dealing with what the motor needs to
% be able to do in order for the pump to perform to a certain level. It
% takes the flow rate from the flow rate needed code, and also takes the
% accumulator volume to get an accumulator pressure for parts of the
%% Calculations
%From these parameters we can calculcate the maximum force on the end of
% the piston, we need to convert from psi to N*m
ForceP = ((approxaccumpres-Pair)*psitoNm)*(PistonA);
%Accounting for the frictional forces in the system, specifically of the
% piston moving up and down the cylinder, N, we are assuming this is 0 as
% we are working with a diaphragm pump which has very low friction
Ffric = 0;
%Calculating the total force in the system from the pump at maximum
%performance requirements
Ftotal = Ffric + ForceP;
% this is the maximum torque needed by the motor and is proportional to the
% radius of off-axis rotation from the force pressing down on
% the piston. Adding a 15% additional efficiency factor due to losses in
% the syste
Tmax = Ftotal*OffAxisR*1.15
%Now going to calculate the needed revolutions per minute from the motor
%which are important for choosing the actual motor that we are going to use
%This is just the average value and would need to be much higher for the
%free spinning part
MotorMaxRPM = flowrateneeded/dispVol