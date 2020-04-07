%% Flow Rate Needed
% Cameron Maltman 01/09/2019
%% Calculation
% The point of this calculation is to see the average flow you need to get
% to obtain the given fill time. It is used for a proxy of understanding
% what required flow rates are needed over the progression
%setting a testing volume for the accumulator volume
approxaccumvol = 1.5;
% calculating the accumulator pressure
approxaccumpres = accumulatorpressure(approxaccumvol,actuavol,actuapres+Pair,Pair);
%calculating the starting moles
nstart = (actuapres+Pair)*approxaccumvol/(Rgas*Temp);
%calculating the ending moles
nfinish = approxaccumpres*approxaccumvol/(Rgas*Temp);
% calculating the number of moles under standard conditions as that is the
% output of the flow meter
VolNeed = (nfinish-nstart)*Rgas*Temp/Pair;
%calculating the final value in liters/min needed by the system for a
%pneumatic recharge time of 10 seconds
flowrateneeded = (VolNeed/pneumrecharge)*(60)
%This is the average flow rate needed by the system in order to obtain the
%pneumatic recharge time of the goal