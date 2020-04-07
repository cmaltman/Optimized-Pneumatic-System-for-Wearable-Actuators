%% Accumulator Volume
% Cameron Maltman ES100 09/23/19
%% Description
%this function gives the accumulator volume needed given an actuator
%pressure, actuator volume, and accumulator pressure. Assuming no losses in
%this particular function
%% Solving for Accumulator Initial Volume
% this function will give you the final necessary accumulator volume with a few
% inputs. Assuming that the values are added in absolute pressures. Also
% assuming no losses due to tubing pressurization
function accumVol = accumulatorvolume(accumPres, actuaVol, actuaPres, airP)
    %assuming temperature changes are relatively negiligble
    accumVol = (actuaVol*(actuaPres-airP))/(accumPres-actuaPres);
end
