%% Bland altman eva

load('all_subj_param2.mat')

%% BR right area

%Area

%Calculate mean and  dif between session

%BR

BDifSes12 = ParamBrRight(:,1,1)-ParamBrRight(:,1,2);             %dif btw session 1 and 2
BDifSes13 = ParamBrRight(:,1,1)-ParamBrRight(:,1,3);             %dif btw session 1 and 3

BMeanSes12 = (ParamBrRight(:,1,1)+ParamBrRight(:,1,2))./2;       %mean of session 1 and 2
BMeanSes13 = (ParamBrRight(:,1,1)+ParamBrRight(:,1,3))./2;       %mean of session 1 and 3

BSDC12 = nanstd(BDifSes12)*1.96;                                  %sdc btw session 1 and 2
BSDC13 = nanstd(BDifSes13)*1.96;                                  %sdc btw session 1 and 3

%FDI

FDifSes12 = ParamFdiRight(:,1,1)-ParamFdiRight(:,1,2);             %dif btw session 1 and 2
FDifSes13 = ParamFdiRight(:,1,1)-ParamFdiRight(:,1,3);             %dif btw session 1 and 3

FMeanSes12 = (ParamFdiRight(:,1,1)+ParamFdiRight(:,1,2))./2;       %mean of session 1 and 2
FMeanSes13 = (ParamFdiRight(:,1,1)+ParamFdiRight(:,1,3))./2;       %mean of session 1 and 3

FSDC12 = nanstd(FDifSes12)*1.96;                                  %sdc btw session 1 and 2
FSDC13 = nanstd(FDifSes13)*1.96;                                  %sdc btw session 1 and 3


figure(1)
subplot(1,2,1)
hold on
scatter(BMeanSes12,BDifSes12,100, 'filled', 'o')
hold on
yline(nanmean(BDifSes12), 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5 )
yline((nanmean(BDifSes12)+BSDC12), '--', 'Color', [0 0.4470 0.7410],'LineWidth', 2.5)
yline((nanmean(BDifSes12)-BSDC12), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5)
xlim([300 2000]);
ylim([-1800 1800]);
xlabel('Average (mm^2)','fontweight','bold')
ylabel('Difference (mm^2)','fontweight','bold')
set(gca,'FontSize', 19)
hold on

scatter(FMeanSes12,FDifSes12,100, 'filled', 'o')
hold on
yline(nanmean(FDifSes12), 'Color', [1 0.2 0.2], 'LineWidth', 2.5 )
yline((nanmean(FDifSes12)+FSDC12), '--', 'Color', [1 0.2 0.2], 'LineWidth', 2.5)
yline((nanmean(FDifSes12)-FSDC12), '--', 'Color', [1 0.2 0.2], 'LineWidth', 2.5)
xlim([300 2000]);
ylim([-1800 1800]);
xlabel('Average (mm^2)','fontweight','bold')
ylabel('Difference (mm^2)','fontweight','bold')
set(gca,'FontSize', 19)

title({
    ['SDC Within-session Area' ] 
    ['BR = ' num2str(round(BSDC12)), 'mm^2', ' and FDI = ' num2str(round(FSDC12)), 'mm^2']});

    

subplot(1,2,2)
hold on
scatter(BMeanSes13,BDifSes13,100, 'filled', 'o')
hold on
yline(nanmean(BDifSes13), 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5 )
yline((nanmean(BDifSes13)+BSDC13), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5)
yline((nanmean(BDifSes13)-BSDC13), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5)
xlim([300 2000]);
ylim([-1800 1800]);
xlabel('Average (mm^2)','fontweight','bold')
ylabel('Difference (mm^2)','fontweight','bold')
set(gca,'FontSize', 19)
hold on

scatter(FMeanSes13,FDifSes13,100, 'filled', 'o')
hold on
yline(nanmean(FDifSes13), 'Color', [1 0.2 0.2], 'LineWidth', 2.5 )
yline((nanmean(FDifSes13)+FSDC13), '--', 'Color', [1 0.2 0.2], 'LineWidth', 2.5)
yline((nanmean(FDifSes13)-FSDC13), '--', 'Color', [1 0.2 0.2], 'LineWidth', 2.5)
xlim([300 2000]);
ylim([-1800 1800]);
xlabel('Average (mm^2)','fontweight','bold')
ylabel('Difference (mm^2)','fontweight','bold')
set(gca,'FontSize', 19)

title({
    ['SDC Between-session Area' ] 
    ['BR = ' num2str(round(BSDC13)), 'mm^2', ' and FDI = ' num2str(round(FSDC13)), 'mm^2']});


%% Volume

%BR

BDifSes12 = ParamBrRight(:,2,1)-ParamBrRight(:,2,2);             %dif btw session 1 and 2
BDifSes13 = ParamBrRight(:,2,1)-ParamBrRight(:,2,3);             %dif btw session 1 and 3

BMeanSes12 = (ParamBrRight(:,2,1)+ParamBrRight(:,2,2))./2;       %mean of session 1 and 2
BMeanSes13 = (ParamBrRight(:,2,1)+ParamBrRight(:,2,3))./2;       %mean of session 1 and 3

BSDC12 = nanstd(BDifSes12)*1.96;                                  %sdc btw session 1 and 2
BSDC13 = nanstd(BDifSes13)*1.96;                                  %sdc btw session 1 and 3

%FDI

FDifSes12 = ParamFdiRight(:,2,1)-ParamFdiRight(:,2,2);             %dif btw session 1 and 2
FDifSes13 = ParamFdiRight(:,2,1)-ParamFdiRight(:,2,3);             %dif btw session 1 and 3

FMeanSes12 = (ParamFdiRight(:,2,1)+ParamFdiRight(:,2,2))./2;       %mean of session 1 and 2
FMeanSes13 = (ParamFdiRight(:,2,1)+ParamFdiRight(:,2,3))./2;       %mean of session 1 and 3

FSDC12 = nanstd(FDifSes12)*1.96;                                  %sdc btw session 1 and 2
FSDC13 = nanstd(FDifSes13)*1.96;                                  %sdc btw session 1 and 3


figure(1)
subplot(1,2,1)
hold on
scatter(BMeanSes12,BDifSes12,100, 'filled', 'o')
hold on
yline(nanmean(BDifSes12), 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5 )
yline((nanmean(BDifSes12)+BSDC12), '--', 'Color', [0 0.4470 0.7410],'LineWidth', 2.5)
yline((nanmean(BDifSes12)-BSDC12), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5)
% xlim([500 2000]);
% ylim([-1800 1800]);
xlabel('Average log(mm^2*mV)','fontweight','bold')
ylabel('Difference log(mm^2*mV)','fontweight','bold')
set(gca,'FontSize', 19)
hold on

scatter(FMeanSes12,FDifSes12,100, 'filled', 'o')
hold on
yline(nanmean(FDifSes12), 'Color', [1 0.2 0.2], 'LineWidth', 2.5 )
yline((nanmean(FDifSes12)+FSDC12), '--', 'Color', [1 0.2 0.2], 'LineWidth', 2.5)
yline((nanmean(FDifSes12)-FSDC12), '--', 'Color', [1 0.2 0.2], 'LineWidth', 2.5)
% xlim([500 2000]);
ylim([-3 3]);
xlabel('Average log(mm^2*mV)','fontweight','bold')
ylabel('Difference log(mm^2*mV)','fontweight','bold')
set(gca,'FontSize', 19)

title({
    ['SDC Within-session Volume' ] 
    ['BR = ' num2str(round(BSDC12)), ' log(mm^2*mV)', ' and FDI = ' num2str(round(FSDC12)), ' log(mm^2*mV)']});


subplot(1,2,2)
hold on
scatter(BMeanSes13,BDifSes13,100, 'filled', 'o')
hold on
yline(nanmean(BDifSes13), 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5 )
yline((nanmean(BDifSes13)+BSDC13), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5)
yline((nanmean(BDifSes13)-BSDC13), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5)
% xlim([500 2000]);
% ylim([-1800 1800]);
xlabel('Average log(mm^2*mV)','fontweight','bold')
ylabel('Difference log(mm^2*mV)','fontweight','bold')
set(gca,'FontSize', 19)
hold on

scatter(FMeanSes13,FDifSes13,100, 'filled', 'o')
hold on
yline(nanmean(FDifSes13), 'Color', [1 0.2 0.2], 'LineWidth', 2.5 )
yline((nanmean(FDifSes13)+FSDC13), '--', 'Color', [1 0.2 0.2], 'LineWidth', 2.5)
yline((nanmean(FDifSes13)-FSDC13), '--', 'Color', [1 0.2 0.2], 'LineWidth', 2.5)
% xlim([500 2000]);
ylim([-3 3]);
xlabel('Average log(mm^2*mV)','fontweight','bold')
ylabel('Difference log(mm^2*mV)','fontweight','bold')
set(gca,'FontSize', 19)

title({
    ['SDC Between-session Volume' ] 
    ['BR = ' num2str(round(BSDC13)), ' log(mm^2*mV)', ' and FDI = ' num2str(round(FSDC13)), ' log(mm^2*mV)']});

%% Xcog

%BR

BDifSes12 = ParamBrRight(:,3,1)-ParamBrRight(:,3,2);             %dif btw session 1 and 2
BDifSes13 = ParamBrRight(:,3,1)-ParamBrRight(:,3,3);             %dif btw session 1 and 3

BMeanSes12 = (ParamBrRight(:,3,1)+ParamBrRight(:,3,2))./2;       %mean of session 1 and 2
BMeanSes13 = (ParamBrRight(:,3,1)+ParamBrRight(:,3,3))./2;       %mean of session 1 and 3

BSDC12 = nanstd(BDifSes12)*1.96;                                  %sdc btw session 1 and 2
BSDC13 = nanstd(BDifSes13)*1.96;                                  %sdc btw session 1 and 3

%FDI

FDifSes12 = ParamFdiRight(:,3,1)-ParamFdiRight(:,3,2);             %dif btw session 1 and 2
FDifSes13 = ParamFdiRight(:,3,1)-ParamFdiRight(:,3,3);             %dif btw session 1 and 3

FMeanSes12 = (ParamFdiRight(:,3,1)+ParamFdiRight(:,3,2))./2;       %mean of session 1 and 2
FMeanSes13 = (ParamFdiRight(:,3,1)+ParamFdiRight(:,3,3))./2;       %mean of session 1 and 3

FSDC12 = nanstd(FDifSes12)*1.96;                                  %sdc btw session 1 and 2
FSDC13 = nanstd(FDifSes13)*1.96;                                  %sdc btw session 1 and 3


figure(1)
subplot(1,2,1)
hold on
scatter(BMeanSes12,BDifSes12,100, 'filled', 'o')
hold on
yline(nanmean(BDifSes12), 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5 )
yline((nanmean(BDifSes12)+BSDC12), '--', 'Color', [0 0.4470 0.7410],'LineWidth', 2.5)
yline((nanmean(BDifSes12)-BSDC12), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5)
xlim([10 50]);
ylim([-25 25]);
xlabel('Average (mm)','fontweight','bold')
ylabel('Difference (mm)','fontweight','bold')
set(gca,'FontSize', 19)
hold on

scatter(FMeanSes12,FDifSes12,100, 'filled', 'o')
hold on
yline(nanmean(FDifSes12), 'Color', [1 0.2 0.2], 'LineWidth', 2.5 )
yline((nanmean(FDifSes12)+FSDC12), '--', 'Color', [1 0.2 0.2], 'LineWidth', 2.5)
yline((nanmean(FDifSes12)-FSDC12), '--', 'Color', [1 0.2 0.2], 'LineWidth', 2.5)
xlim([10 50]);
ylim([-25 25]);
xlabel('Average (mm)','fontweight','bold')
ylabel('Difference (mm)','fontweight','bold')
set(gca,'FontSize', 19)

title({
    ['SDC Within-session Xcog' ] 
    ['BR = ' num2str(round(BSDC12)), 'mm', ' and FDI = ' num2str(round(FSDC12)), 'mm']});


subplot(1,2,2)
hold on
scatter(BMeanSes13,BDifSes13,100, 'filled', 'o')
hold on
yline(nanmean(BDifSes13), 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5 )
yline((nanmean(BDifSes13)+BSDC13), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5)
yline((nanmean(BDifSes13)-BSDC13), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5)
xlim([10 50]);
ylim([-25 25]);
xlabel('Average (mm)','fontweight','bold')
ylabel('Difference (mm)','fontweight','bold')
set(gca,'FontSize', 19)
hold on

scatter(FMeanSes13,FDifSes13,100, 'filled', 'o')
hold on
yline(nanmean(FDifSes13), 'Color', [1 0.2 0.2], 'LineWidth', 2.5 )
yline((nanmean(FDifSes13)+FSDC13), '--', 'Color', [1 0.2 0.2], 'LineWidth', 2.5)
yline((nanmean(FDifSes13)-FSDC13), '--', 'Color', [1 0.2 0.2], 'LineWidth', 2.5)
xlim([10 50]);
ylim([-25 25]);
xlabel('Average (mm)','fontweight','bold')
ylabel('Difference (mm)','fontweight','bold')
set(gca,'FontSize', 19)

title({
    ['SDC Between-session Xcog' ] 
    ['BR = ' num2str(round(BSDC13)), 'mm', ' and FDI = ' num2str(round(FSDC13)), 'mm']});


%% Ycog

BDifSes12 = ParamBrRight(:,4,1)-ParamBrRight(:,4,2);             %dif btw session 1 and 2
BDifSes13 = ParamBrRight(:,4,1)-ParamBrRight(:,4,3);             %dif btw session 1 and 3

BMeanSes12 = (ParamBrRight(:,4,1)+ParamBrRight(:,4,2))./2;       %mean of session 1 and 2
BMeanSes13 = (ParamBrRight(:,4,1)+ParamBrRight(:,4,3))./2;       %mean of session 1 and 3

BSDC12 = nanstd(BDifSes12)*1.96;                                  %sdc btw session 1 and 2
BSDC13 = nanstd(BDifSes13)*1.96;                                  %sdc btw session 1 and 3

%FDI

FDifSes12 = ParamFdiRight(:,4,1)-ParamFdiRight(:,4,2);             %dif btw session 1 and 2
FDifSes13 = ParamFdiRight(:,4,1)-ParamFdiRight(:,4,3);             %dif btw session 1 and 3

FMeanSes12 = (ParamFdiRight(:,4,1)+ParamFdiRight(:,4,2))./2;       %mean of session 1 and 2
FMeanSes13 = (ParamFdiRight(:,4,1)+ParamFdiRight(:,4,3))./2;       %mean of session 1 and 3

FSDC12 = nanstd(FDifSes12)*1.96;                                  %sdc btw session 1 and 2
FSDC13 = nanstd(FDifSes13)*1.96;                                  %sdc btw session 1 and 3


figure(1)
subplot(1,2,1)
hold on
scatter(BMeanSes12,BDifSes12,100, 'filled', 'o')
hold on
yline(nanmean(BDifSes12), 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5 )
yline((nanmean(BDifSes12)+BSDC12), '--', 'Color', [0 0.4470 0.7410],'LineWidth', 2.5)
yline((nanmean(BDifSes12)-BSDC12), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5)
xlim([-25 45]);
ylim([-20 20]);
xlabel('Average (mm)','fontweight','bold')
ylabel('Difference (mm)','fontweight','bold')
set(gca,'FontSize', 19)
hold on

scatter(FMeanSes12,FDifSes12,100, 'filled', 'o')
hold on
yline(nanmean(FDifSes12), 'Color', [1 0.2 0.2], 'LineWidth', 2.5 )
yline((nanmean(FDifSes12)+FSDC12), '--', 'Color', [1 0.2 0.2], 'LineWidth', 2.5)
yline((nanmean(FDifSes12)-FSDC12), '--', 'Color', [1 0.2 0.2], 'LineWidth', 2.5)
xlim([-30 20]);
ylim([-20 20]);
xlabel('Average (mm)','fontweight','bold')
ylabel('Difference (mm)','fontweight','bold')
set(gca,'FontSize', 19)

title({
    ['SDC Within-session Ycog' ] 
    ['BR = ' num2str(round(BSDC12)), 'mm', ' and FDI = ' num2str(round(FSDC12)), 'mm']});


subplot(1,2,2)
hold on
scatter(BMeanSes13,BDifSes13,100, 'filled', 'o')
hold on
yline(nanmean(BDifSes13), 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5 )
yline((nanmean(BDifSes13)+BSDC13), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5)
yline((nanmean(BDifSes13)-BSDC13), '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5)
xlim([-30 20]);
ylim([-20 20]);
xlabel('Average (mm)','fontweight','bold')
ylabel('Difference (mm)','fontweight','bold')
set(gca,'FontSize', 19)
hold on

scatter(FMeanSes13,FDifSes13,100, 'filled', 'o')
hold on
yline(nanmean(FDifSes13), 'Color', [1 0.2 0.2], 'LineWidth', 2.5 )
yline((nanmean(FDifSes13)+FSDC13), '--', 'Color', [1 0.2 0.2], 'LineWidth', 2.5)
yline((nanmean(FDifSes13)-FSDC13), '--', 'Color', [1 0.2 0.2], 'LineWidth', 2.5)
xlim([-30 20]);
ylim([-20 20]);
xlabel('Average (mm)','fontweight','bold')
ylabel('Difference (mm)','fontweight','bold')
set(gca,'FontSize', 19)

title({
    ['SDC Between-session Ycog' ] 
    ['BR = ' num2str(round(BSDC13)), 'mm', ' and FDI = ' num2str(round(FSDC13)), 'mm']});



