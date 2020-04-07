%% Accumulator Pressure
% Cameron Maltman ES100 09/23/19
%% Description
% This file gives the accumulator pressure given the acctuator volume, goal
% actuator pressure, and accumulator volume, assuming no losses with this
% particular function
%% Solving for Accumulator Initial Pressure
% this function will give you the final accumulator pressure with a few
% inputs. Assuming that all inputs are absolute pressures. Also assuming no
% loss due to tubing pressurization
function accumPres = accumulatorpressure(accumVol, actuaVol, actuaPres, airP)
    %assuming temperature changes are relatively negiligble
    accumPres = ((actuaPres.*(actuaVol+accumVol))-(airP.*actuaVol))./accumVol;
end