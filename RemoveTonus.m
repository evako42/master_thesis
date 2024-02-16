function [emgmatrix100, traces_removed] = remove_tonus(xmlfile)
%% setvariables

[emg, ~, ~] = loaddata('03_br_long_left.nnm');
emgmatrix = [emg{:}].*1000;

baselinewindow  = [0, 0.1];  %window in seconds (muscle relaxed?)
peakwindow      = [0.1,   0.16];    %window in seconds (is there mep?) 
stoptime        = 1;             %end trial in seconds
starttime = 0;
Fs = 5000; 
trialtime = starttime:(1/Fs):starttime+(size(emgmatrix,1)-1)*(1/Fs);

baselinesamples = find(trialtime>=baselinewindow(1),1) :find(trialtime>=baselinewindow(2),1);

baselinepeaks = (max(emgmatrix(baselinesamples,:,:))-min(emgmatrix(baselinesamples,:,:)));
baselinepeaks = reshape(baselinepeaks,size(baselinepeaks,2),[],1);        % 10 - 1000 Hz
%% Removing because of stds

Tonus = std(emgmatrix(baselinesamples,:,:)); %get std(rms) of baseline for each trace
Tonus = reshape(Tonus,size(Tonus,2),[],1);


%% Plotting

% plot original
figure(200)
hold on
subplot(1,4,1)
plot(trialtime,emgmatrix(:,:))
ylim([-0.5 0.5])
xlim([0 0.2])
title('Original')

%plot removed peak-to-peak
baselinepeaks(baselinepeaks > 0.2) = 0;
idx2 = find(emgmatrix(baselinepeaks == 0));

emgmatrix2 = emgmatrix;

subplot(1,4,2)
plot(trialtime,emgmatrix2(:,idx2))
ylim([-0.5 0.5])
xlim([0 0.2])
title('To be removed because of peak-to-peak')

emgmatrix2(:,idx2) = [];
%plot removed 2 stds

TonusLim = repmat(mean(Tonus)+2*std(Tonus),size(Tonus,1),1);
Macho = Tonus>TonusLim;
idx4 = find(emgmatrix2(Macho == 1));

emgmatrix3 = emgmatrix2;

subplot(1,4,3)
plot(trialtime, emgmatrix3(:,idx4))
ylim([-0.5 0.5])
xlim([0 0.2])
title('To be removed because of 2 stds')

% and what is left

emgmatrix3(:,idx4) = [];

subplot(1,4,4)
plot(trialtime,emgmatrix3)
ylim([-0.5 0.5])
xlim([0 0.2])
title('After removal')

traces_removed = size(emgmatrix,2) - size(emgmatrix3,2)

end

