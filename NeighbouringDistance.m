clear all
format shortG % avoid the 1.0e+03
path = 'C:\Users\evako\Desktop\Erasmus MC 2020-2021\Lab\Real participants';
cd 'C:\Users\evako\Desktop\Erasmus MC 2020-2021\Lab\Real participants'
folders = dir(pwd);
folders = folders(3:end);

%% BR mean coordinates

ChangeBR = NaN(length(folders),1,3); % participants, z coordinate, sessions

for i = 1:length(folders) % for all the participants
    oldFolder = cd([path '\', num2str(i)]);
    
    for s = 1:3 % number of sessions
        filename = ([num2str(i) '_br_ses' num2str(s) '_right.nnm']);
        if isfile(filename)
            %get old number, original z
            [~ ,~, pos] = loaddata(filename);
            Coordinates = [pos{:}]';
            Coordinates = Coordinates(2:end,:);
            
            %get new number, plane fitted z coordinates
            planeformula = @(P,X)X(:,1)*P(1)+X(:,2)*P(2)+P(3);
            P1 = nlinfit(Coordinates(:,1:2),Coordinates(:,3),planeformula,[1 1 1]);
            PlaneData = Coordinates;
            PlaneData(:,3) = planeformula(P1,PlaneData(:,1:2));
            
            %calculate percentual change
            Diff = PlaneData(:,3) - Coordinates(:,3);
            ChangeBR(i,:,s) = Diff(i);
        end
    end
end

%% FDI mean coordinates

ChangeFDI = NaN(length(folders),1,3); % participants, z coordinate, sessions

for i = 1:length(folders) % for all the participants
    oldFolder = cd([path '\', num2str(i)]);
    
    for s = 1:3 % number of sessions
        filename = ([num2str(i) '_fdi_ses' num2str(s) '_right.nnm']);
        if isfile(filename)
            %get old number, original z
            [~ ,~, pos] = loaddata(filename);
            Coordinates = [pos{:}]';
            Coordinates = Coordinates(2:end,:);
            
            %get new number, plane fitted z coordinates
            planeformula = @(P,X)X(:,1)*P(1)+X(:,2)*P(2)+P(3);
            P1 = nlinfit(Coordinates(:,1:2),Coordinates(:,3),planeformula,[1 1 1]);
            PlaneData = Coordinates;
            PlaneData(:,3) = planeformula(P1,PlaneData(:,1:2));
            
            %calculate percentual change
            Diff = PlaneData(:,3) - Coordinates(:,3);
            ChangeFDI(i,:,s) = (Diff(i) / Coordinates(:,3)) * 100;
        end
    end
end

%% Calculate the mean of the percentual change

MeanBR = nanmean(nanmean(ChangeBR));
MeanFDI = nanmean(nanmean(ChangeFDI));


