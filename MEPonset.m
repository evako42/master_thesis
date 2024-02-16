peakwindow      = [0.010,   0.050];
fs = 2000;
t = 0.08;
Trialtime = t/Fs;

peaksamples = find(Trialtime>= peakwindow(1),1):find(Trialtime>=peakwindow(2),1);

fc = [10 1000]; %cutoff frequency
[b,a] = butter(3,fc./(fs/2));       %butterworth filter: 3rd order with the defined cutoff frequency
y = filtfilt( b , a , Trialdata) ;  %zero phase digital filtering: trialdata = input data
peaktrialtime = Trialtime(peaksamples);
yp  = (y(peaksamples,:,:)); %from the filtered data take out only the peaksamples, copy the rest
nyp = yp;                   %why make a new variable?
nyp(:,:,1:2) = nyp(:,:,1:2)*-1; %why do this?

flipnyp = flipud(nyp); %flip array up to down
[flipnypmaxamp, flipnypmaxindex] = max(flipnyp); %get the max out
flipnypmaxamp = squeeze(flipnypmaxamp); %Remove dimensions of length 1
flipnypmaxindex = squeeze(flipnypmaxindex);

flipnyponsetindex = zeros(150,4);   %for 150 trials and for 4 muscles
for muscle = 1:4  %make plots for the MEPs
    for trial = 1:150
        if flipnypmaxamp(trial,muscle)>20==1
            
            figure(1)
            hold on
            plot(flipnyp(:,trial,muscle))
            plot(flipnypmaxindex(trial,muscle),flipnyp(flipnypmaxindex(trial,muscle),trial,muscle),'o')
            flipnyponsetindex(trial,muscle) = find(flipnyp(flipnypmaxindex(trial,muscle):end,trial,muscle)<flipnypmaxamp(trial,muscle)*0.1,1)-1+flipnypmaxindex(trial,muscle);
            plot(flipnyponsetindex(trial,muscle),flipnyp(flipnyponsetindex(trial,muscle),trial,muscle),'o');
        else
        end
        
    end
end

nyponsetindex = numel(peaksamples)-flipnyponsetindex+1;
nyponsetindex(nyponsetindex==numel(peaksamples)+1)=1;
onset = peaktrialtime(nyponsetindex);
onset(onset==peaktrialtime(1))=NaN;

figure(11)
hold on
for i = 1:4
    histogram(onset(:,i),10)
end