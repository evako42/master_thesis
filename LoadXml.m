function [Mep, Tonus, trialtime, emgmatrix] = Loadxml(xmlfile, NumChan)
%% setvariables


baselinewindow  = [0, 0.1];  %window in seconds (muscle relaxed?)
%peakwindow      = [0.11,   0.13];    %window in seconds (is there mep?) 

peakwindow = [0.115,   0.15];

%% Load data

if NumChan == 1
    [emg, ~, ~] = loaddata(xmlfile);
end 

if NumChan == 2
    [~, emg, ~] = loaddata(xmlfile);
end 

emgmatrix = [emg{:}].*1000;

%skip first pulse --> usually bad and off coordinates
emgmatrix = emgmatrix(:,2:end);

%% getting the time
starttime = 0;
Fs = 5000; 
trialtime = starttime:(1/Fs):starttime+(size(emgmatrix,1)-1)*(1/Fs);

baselinesamples = find(trialtime>=baselinewindow(1),1) :find(trialtime>=baselinewindow(2),1); %get baseline sample indices
peaksamples = find(trialtime>= peakwindow(1),1):find(trialtime>=peakwindow(2),1); %get peakwindow sample indices


%% check baseline

Tonus = std(emgmatrix(baselinesamples,:,:)); %get std(rms) of baseline for each trace
Tonus = reshape(Tonus,size(Tonus,2),[],1);

%% checkmep

Mep = (max(emgmatrix(peaksamples,:,:))-min(emgmatrix(peaksamples,:,:)));
Mep = reshape(Mep,size(Mep,2),[],1);        

%% plot

plot(trialtime,emgmatrix)
xlim([0 0.2])
set(gca,'FontSize', 20)

end

