function [RotatedData2, Mep2, Translation, RotationMatrix, angleX, angleY, angleZ, removed_ci, removed_stds, Deleted, ShiftedData2] = RotateZ(filename, Mep, Tonus)
% load(filename);

[~ ,~, pos] = loaddata(filename);
Coordinates = [pos{:}]';
Coordinates = Coordinates(2:end,:);

if size(Mep,2) == 1;
     Mep(:,2) = NaN;
     Tonus(:,2) = NaN;
end

% Mep  = Mep./1000;

% put 2 stds to nans
TonusLim = repmat(mean(Tonus)+2*std(Tonus),size(Tonus,1),1);
Macho = Tonus>TonusLim;
Mep(Macho) = NaN;

%count nans because of stds
removed_stds = find(Macho);

%% Clean the data
z = 2.58;
PIup = repmat(nanmean(Coordinates)+nanstd(Coordinates).*z,size(Coordinates,1),1);
PIdown = repmat(nanmean(Coordinates)-nanstd(Coordinates).*z,size(Coordinates,1),1);
Miss = sum(Coordinates<PIdown|Coordinates>PIup,2)>0;
% %%

Coordinates(Miss,:)=NaN;
Tonus(Miss,:)=NaN;
Mep(Miss,:) = NaN;

removed_ci = find(Miss & ~Macho);

%% Plot original coordinates

% scatter3(Coordinates(:,1),Coordinates(:,2),Coordinates(:,3),'b','linewidth',4)
% xlabel('xlabel')
% ylabel('ylabel')
% zlabel('zlabel')

%% Fit surface through datapoints
planeformula = @(P,X)X(:,1)*P(1)+X(:,2)*P(2)+P(3);
P1 = nlinfit(Coordinates(:,1:2),Coordinates(:,3),planeformula,[1 1 1]);
PlaneData = Coordinates;
PlaneData(:,3) = planeformula(P1,PlaneData(:,1:2));

% Find middle of dataSet
% Translation = nanmean(PlaneData);
Translation = nanmedian(Coordinates);
change = repmat(Translation,size(PlaneData,1),1);
ShiftData = Coordinates-repmat(Translation,size(PlaneData,1),1);

% Get points on original X and Y axis
P2 = P1;
P2(3) = 0; % Fit for shifted data
xpp = [0,0,0        ;   -10:10:10]';
xpp(:,3) = planeformula(P2,xpp(:,1:2));
ypp = [-10:10:10    ;   0,0,0]';
ypp(:,3) = planeformula(P2,ypp(:,1:2));

% % Plot Translated Datapoints
figure(1)
scatter3(ShiftData(:,1),ShiftData(:,2),ShiftData(:,3),'b','linewidth',4);
hold on
scatter3(xpp(:,1),xpp(:,2),xpp(:,3),'g','linewidth',4);
scatter3(ypp(:,1),ypp(:,2),ypp(:,3),'r','linewidth',4);
xlabel('xlabel')
ylabel('ylabel')
zlabel('zlabel')
axis([-20 20 -20 20 -20 20]);
axis([-30 30 -30 30 -30 30]);

%% Rotate around x-axis
PointForXRotation = [0, 10, NaN];
PointForXRotation(3) = planeformula(P2,PointForXRotation([1,2]));
angleX = -atand(PointForXRotation(3)/PointForXRotation(2));  
RotationMatrixX = [ 1 , 0 , 0;
                    0, cosd(angleX), sind(angleX);...
                    0, -sind(angleX), cosd(angleX)];
                
XRotatedData = ShiftData*RotationMatrixX;
xpp = xpp*RotationMatrixX;
ypp = ypp*RotationMatrixX;

figure(2)
scatter3(XRotatedData(:,1),XRotatedData(:,2),XRotatedData(:,3),'b','linewidth',4)
hold on
scatter3(xpp(:,1),xpp(:,2),xpp(:,3),'g','linewidth',4);
scatter3(ypp(:,1),ypp(:,2),ypp(:,3),'r','linewidth',4);
xlabel('xlabel')
ylabel('ylabel')
zlabel('zlabel')
axis([-20 20 -20 20 -20 20]);
axis([-30 30 -30 30 -30 30]);

%% Rotate around y-axis
P3 = nlinfit(XRotatedData(:,1:2),XRotatedData(:,3),planeformula,[1 1 1]);
PointForYRotation = [10, 0, NaN];
PointForYRotation(3) = planeformula(P3,PointForYRotation([1,2]));
angleY = atand(PointForYRotation(3)/PointForYRotation(1));
RotationMatrixY = [ cosd(angleY), 0, -sind(angleY);...
                    0           , 1,        0     ;...
                    sind(angleY), 0,  cosd(angleY)];        
                
YRotatedData = XRotatedData*RotationMatrixY;
xpp = xpp*RotationMatrixY;
ypp = ypp*RotationMatrixY;

figure(3)
scatter3(YRotatedData(:,1),YRotatedData(:,2),YRotatedData(:,3),'b','linewidth',4)
hold on
scatter3(xpp(:,1),xpp(:,2),xpp(:,3),'g','linewidth',4);
scatter3(ypp(:,1),ypp(:,2),ypp(:,3),'r','linewidth',4);
xlabel('xlabel')
ylabel('ylabel')
zlabel('zlabel')
axis([-20 20 -20 20 -20 20]);
axis([-30 30 -30 30 -30 30]);         


%% Rotate around z-axis
angleZ = atand(ypp(1,2)/ypp(1,1));
RotationMatrixZ = [ cosd(angleZ), -sind(angleZ),    0;...
                    sind(angleZ), cosd(angleZ),     0;...
                    0,              0,              0];
                
ZRotatedData = YRotatedData*RotationMatrixZ;
xpp = xpp*RotationMatrixZ;
ypp = ypp*RotationMatrixZ;
% 
figure(4)
scatter3(ZRotatedData(:,1),ZRotatedData(:,2),ZRotatedData(:,3),'b','linewidth',4)
hold on
scatter3(xpp(:,1),xpp(:,2),xpp(:,3),'g','linewidth',4);
scatter3(ypp(:,1),ypp(:,2),ypp(:,3),'r','linewidth',4);
xlabel('xlabel')
ylabel('ylabel')
zlabel('zlabel')
axis([-20 20 -20 20 -20 20]);
axis([-30 30 -30 30 -30 30]);  


%% Create Usefull Matrices       

RotationMatrix = RotationMatrixX*RotationMatrixY*RotationMatrixZ;
ShiftedData = ShiftData*RotationMatrix;

%And now the inverse of the translation from before (for cog)
RotatedData = ShiftedData + change;

%Put Z-axis on 0, otherwise stays on median of Z-axis which I don't want
RotatedData(:,3) = 0;

%% plot rotated data

figure(5);
scatter3(RotatedData(:,1),RotatedData(:,2),RotatedData(:,3),'b','linewidth',4)
xlabel('xlabel')
ylabel('ylabel')
zlabel('zlabel')

%% Removal counter
% 
% Mep2 = Mep;
% Mep2(removed_ci | removed_stds) = [];
% 
% idx = find(isnan(Mep));
% RotatedData2 = RotatedData;
% RotatedData2(idx,:) = [];
% 
% ShiftedData2 = ShiftedData;
% ShiftedData2(idx,:) = [];


tf_keep = true(size(Mep));
tf_keep([removed_ci(:) ; removed_stds(:)]) = false;
Mep2 = Mep(tf_keep);
RotatedData2 = RotatedData(tf_keep,:);
ShiftedData2 = ShiftedData(tf_keep,:);

% tf = removed_ci | removed_stds;
% Mep2 = Mep(~tf);
% RotatedData2 = RotatedData(~tf,:);
% ShiftedData2 = ShiftedData(~tf,:);

% deleted mean --> correct
Deleted = mean(~tf_keep);

%Deleted = mean(isnan(Mep(:,1))).*100;

