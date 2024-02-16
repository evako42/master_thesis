%% Analysis per person --> in the end add all of the parameters into a new variable (mean, std, etc. for all participants)
clearvars
close all

%% set variables
path = 'C:\Users\evako\Desktop\Erasmus MC 2020-2021\Lab\Real participants\';
cd(path);
numsub = 12;
namemus = 'br';
ses = 'ses1';
hem = 'right';
%hem = 'left';
subjectfolder = cd([path '\' num2str(numsub)]);
filename = [num2str(numsub), '_', namemus, '_', ses, '_', hem '.nnm'];

%% Meps (automate the peak-to-peak)
 
if strcmp(namemus, 'br')
    NumChan = 1;
else
    NumChan = 2;
end

[Mep, Tonus, trialtime, emgmatrix] = Loadxml(filename, NumChan);

%% check MEPs
%FindPeaks settings --> idx max = 80, nbr_local 10, latency_peaks 60

Mep_corrected = FindPeaks(filename, NumChan);
Mep_corrected = Mep_corrected(:);
compare = sum(Mep_corrected == Mep); % Mep smaller in general than Mep_corrected

[Mep_corrected, isrealmep] = FindPeaks2(filename, NumChan);
Mep_corrected = Mep_corrected(:);
compare = sum(Mep_corrected == Mep);

%% Rotated and shifted data

[RotatedData2, Mep2, Translation, RotationMatrix, angleX, angleY, angleZ, ...
    removed_ci, removed_stds, Deleted, ShiftedData2]...
    = RotateZ(filename, Mep, Tonus);

close all
%% Plot removed data

close all
figure(1)
subplot(2, 2, 1)
plot(trialtime, emgmatrix(:, removed_stds))
title('EMG baseline > 2SD')
xlim([0 0.2])
ylim([-0.25 0.2])
set(gca,'FontSize', 13)
xlabel('Time (s)')
ylabel('EMG (mV)')
hold on

if ~isempty(removed_ci)
    subplot(2, 2, 2)
    plot(trialtime, emgmatrix(:, removed_ci))
    title('99% CI')
    xlim([0 0.2])
    ylim([-0.25 0.2])
    set(gca,'FontSize', 13)
    xlabel('Time (s)')
    ylabel('EMG (mV)')
end
hold on

removed_indices = [removed_stds(:) ; removed_ci(:)];

% subplot(2, 2, 3)
% plot(trialtime, emgmatrix(:, removed_indices))
% xlim([0 0.21])
% title('All excluded traces')
% xlim([0 0.2])
% ylim([-0.25 0.18])
% set(gca,'FontSize', 13)
% xlabel('Time (s)')
% ylabel('EMG (mV)')
% hold on

subplot(2, 2, [3 4])
emgmatrix(:, removed_indices) = [];
plot(trialtime, emgmatrix(:, :))
xlim([0 0.21])
title('EMG after exclusion criteria')
xlim([0 0.2])
ylim([-0.25 0.2])
set(gca,'FontSize', 13)
xlabel('Time (s)')
ylabel('EMG (mV)')
hold off


%% Correct 80th percentile

isrealmep(removed_indices) = [];
Mep3 = Mep2;
Mep3(isrealmep == 0) = 0;

%compare
check = sum(Mep3 == Mep2);

%% Plot the motormap
close all
[put_to_zero] = PlotMotorMap(Mep2, RotatedData2);

%% cog, area, volume
close all
[yCog, xCog, medianpixelsize, stepsize, Volume, Area, Peak, NV]...
    = OpenOpen_diff_col(Mep3, RotatedData2, size(RotatedData2,1)); 

%% plot borders, get the index, check the MEP for each particular participant
% % 
close all
x_coord = -2.70;
y_coord = -15.41;
[idx] = PlotBorders(RotatedData2, x_coord, y_coord, trialtime, emgmatrix);
Mep_border = Mep2(idx);

%% Variable containing all the parameters to statistically analyze

%4 columns = area, log(volume), xcog, ycog
param = [Area log(Volume) xCog yCog];

%% Check borders

Border_noise = 0;  
Border_mep = 0;
Almost_borders = 0;
above80 = 1;

%% save workspace

filename2 = [num2str(numsub), '_', namemus, '_', ses, '_', hem '.mat'];
save(filename2)

