function [idx] = PlotBorders(RotatedData,x,y,trialtime,emg)

RotatedData = round(RotatedData,2);
idx = find(RotatedData(:,1) == x & RotatedData(:,2) == y);

plot(trialtime,emg(:,idx))

end

