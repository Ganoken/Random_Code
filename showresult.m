
%load('../Test/chem_nor_mean.mat')
V = 0.0:0.1:1.0;
X = 100:600;
Y = 100:650;
for n=1:9
    %contourf(X,fliplr(Y),Nor_mean2(:,:,n),V)
    contourf(X,fliplr(Y),Nor_mean(:,:,n))
    set(gca, 'FontName','Times','FontSize',16 );
    axis off;
    caxis([0 1]);
    colormap jet
    colorbar
    %colorbar ('TickLabels', {'0.0', '0.1', '0.2', '0.3', '0.4', '0.5', '0.6', '0.7', '0.8', '0.9', '1.0'});
    FileName = ['I:\ch0618\output\image/mean_0.67_Hz' num2str(n,'%02u') '.bmp'];
    saveas(gcf,FileName)
end