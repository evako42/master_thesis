%Read tonus from all and save it as a mean(Tonus) per session per muscle
%per participant, then boxplot to see which one stands out and then
%manually (or automatically - think in what way) remove those

clear all
format shortG % avoid the 1.0e+03
path = 'C:\Users\evako\Desktop\Erasmus MC 2020-2021\Lab\Real participants';
cd 'C:\Users\evako\Desktop\Erasmus MC 2020-2021\Lab\Real participants'
folders = dir(pwd);
folders = folders(3:end);

%% BR right

TonusBrRight = NaN(length(folders),1,3); % participants, mean tonus, sessions

for i = 1:length(folders) % for all the participants
    oldFolder = cd([path '\', num2str(i)]);
    
    for s = 1:3 % number of sessions
        filename = ([num2str(i) '_br_ses' num2str(s) '_right.mat']);
        
        if isfile(filename)
            Tonus = load(filename, 'Tonus');
            TonusBrRight(i,1,s) = mean(Tonus.Tonus);
        end
    end
end

%% FDI right

TonusFdiRight = NaN(length(folders),1,3); % participants, mean tonus, sessions

for i = 1:length(folders) % for all the participants
    oldFolder = cd([path '\', num2str(i)]);
    
    for s = 1:3 % number of sessions
        filename = ([num2str(i) '_fdi_ses' num2str(s) '_right.mat']);
        
        if isfile(filename)
            Tonus = load(filename, 'Tonus');
            TonusFdiRight(i,1,s) = mean(Tonus.Tonus);
        end
    end
end

%% BR left

MepBrLeft = NaN(length(folders),1); % participants, mean tonus

for i = 1:length(folders) % for all the participants
    oldFolder = cd([path '\', num2str(i)]);
    
    filename = ([num2str(i) '_br_ses4_left.mat']);
    
    if isfile(filename)
        Mep2 = load(filename, 'Mep2');
        Mep2 = Mep2.Mep2;
        MepBrLeft(i) = max(Mep2);
    end
    
end

MaxBrLeft = max(MepBrLeft);

%% FDI left

% TonusFdiLeft = NaN(length(folders),1); % participants, mean tonus
% 
% for i = 1:length(folders) % for all the participants
%     oldFolder = cd([path '\', num2str(i)]);
%     
%     filename = ([num2str(i) '_fdi_ses4_left.mat']);
%     
%     if isfile(filename)
%         Tonus = load(filename, 'Tonus');
%         TonusFdiLeft(i,:) = mean(Tonus.Tonus);
%     end
%     
% end

MepFdiLeft = NaN(length(folders),1); % participants, mean tonus

for i = 1:length(folders) % for all the participants
    oldFolder = cd([path '\', num2str(i)]);
    
    filename = ([num2str(i) '_fdi_ses4_left.mat']);
    
    if isfile(filename)
        Mep2 = load(filename, 'Mep2');
        Mep2 = Mep2.Mep2;
        MepFdiLeft(i) = max(Mep2);
    end
    
end

MaxFdiLeft = max(MepFdiLeft);

%% fdi right

MepFdiRight = NaN(length(folders),1); % participants, mean tonus

for i = 1:length(folders) % for all the participants
    oldFolder = cd([path '\', num2str(i)]);
    
    filename = ([num2str(i) '_fdi_ses3_right.mat']);
    
    if isfile(filename)
        Mep2 = load(filename, 'Mep2');
        Mep2 = Mep2.Mep2;
        MepFdiRight(i) = max(Mep2);
    end
    
end

MaxFdiRight = max(MepFdiRight);

%% 

MepBrRight = NaN(length(folders),1); % participants, mean tonus

for i = 1:length(folders) % for all the participants
    oldFolder = cd([path '\', num2str(i)]);
    
    filename = ([num2str(i) '_br_ses3_right.mat']);
    
    if isfile(filename)
        Mep2 = load(filename, 'Mep2');
        Mep2 = Mep2.Mep2;
        MepBrRight(i) = max(Mep2);
    end
    
end

MaxBrRight = max(MepBrRight);

%% inspect with boxplots RIGHT

figure(1)
subplot(1,3,1)
boxplot(TonusBrRight(:,1,1))
title('BR session 1')
hold on
subplot(1,3,2)
boxplot(TonusBrRight(:,1,2))
title('BR session 2')
subplot(1,3,3)
boxplot(TonusBrRight(:,1,3))
title('BR session 3')

figure(2)
subplot(1,3,1)
boxplot(TonusFdiRight(:,1,1))
title('FDI session 1')
hold on
subplot(1,3,2)
boxplot(TonusFdiRight(:,1,2))
title('FDI session 2')
subplot(1,3,3)
boxplot(TonusFdiRight(:,1,3))
title('FDI session 3')

%% Boxplots LEFT

figure(3)
subplot(1,2,1)
boxplot(TonusFdiLeft)
title('FDI session 4')
hold on
subplot(1,2,2)
boxplot(TonusBrLeft)
title('BR session 4')



