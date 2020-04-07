%% Tubing and Connector Losses
% Cameron Maltman 01/09/2019
%% Calculating the Reynold's Number
% It is important to calculate the Reynold's number to make sure that you
% can use the laminar flow conditions through the system
Re = (MaxFlowCalc*TubingID)/(KinVisc*AreaCS)
%From this calculation we realize that we can use laminar flow conditions
%as it is below 2300 which is the start of turbulent flow conditions
%% Pressure Drop Across Tubing
% This section is to calculate the head pressure drop over the course of
% the system during the worst case condition. This is given by the
% Darcy-Weisback equation which is:
% deltaH = f * L/D * V^2/2g
% If it is laminar conditions in a circular pipe we can assume f = 64/Re
deltaP = (64/Re)*(MaxL/TubingID)*((MaxFlowCalc/AreaCS)^2)*(1/(2*g));
deltaPpsi = deltaP/psitoNm %converting the answer to psi 
%From this calculation as well it is easy to see that there will be no
%significant drop in pressure along the length of the tubing
%% Pressure Drop Across Components
% Through connectors we are going to assume there is negiligble drop in
% pressure as they are going to be similar to the drop across the tubing.
% The big pressure drop will come across the valves. This is given by a
% large equation that is shown below. The variables are all imperial for
% this formula and they are explained in Variables.m
deltaPConnect = ((SG*TempRank)/(Pin+Pout))*(((MaxFlowImp)/(960*Cv))^2)
%from this we see that we lose very little pressure in this case and the
%connectors are not something we particularly need to worry about.