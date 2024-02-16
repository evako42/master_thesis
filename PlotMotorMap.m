function [put_to_zero] = PlotMotorMap(Mep2,RotatedData2)

% put meps under 0.05 to 0 and count them
Mep2(Mep2 < 0.05) = 0;
idx = Mep2 == 0;
put_to_zero = sum(idx(:));

%% Plotting the motormap
% 
X = RotatedData2(:,1);
Y = RotatedData2(:,2);
V = Mep2;

[xq,yq] = meshgrid(-80:.1:20, -80:.1:20);
vq = griddata(X,Y,V,xq,yq,'nearest');
plot3(X,Y,V,'mo')
xlim([-80 20])
ylim([-80 20])
hold on
mesh(xq,yq,vq)
set(gca,'FontSize', 20)
title('Motor map') 
xlabel('Medio-lateral axis (mm)')
ylabel('Posterior-anterior axis (mm)')
zlabel('MEP (mV)')

end

