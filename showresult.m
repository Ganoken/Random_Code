
load('../../Output/MeanImage/20170104L_75_on_1_201701_1147mean.mat')
V = 0.0:0.1:1.0;
X = 480:800;
Y = 400:700;
for n=1:32
    contourf(X,Y,MeanImage(:,:,n),V)
    set(gca, 'FontName','Times','FontSize',16 );
    caxis([0 1]);
    colormap hot
    colorbar ('TickLabels', {'0.0', '0.1', '0.2', '0.3', '0.4', '0.5', '0.6', '0.7', '0.8', '0.9', '1.0'});
    FileName = ['../../Output/MeanImage/bmp/75on/Phase' num2str(n,'%02u') '.bmp'];
    saveas(gcf,FileName)
end