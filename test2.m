n=max(H(:,4));
for i=5950:1:6000
    f=(H(:,4)==i);
    s=scatter(H(f,1),H(f,2),((0.05)*(H(f,3)).^(0.5)),'b','filled');
    axis equal
    axis off
    axis([0 4096 0 4096])
    h=gcf;
%     saveas(h,strcat('E:\Devitrification\Experiment-1\psi6_images\Avalanche\Images\',num2str(i),'.tif'));
    set(gcf,'WindowStyle','docked')
%     fig = gcf;
%     fig.PaperPositionMode = 'auto';
    print(strcat('E:\Devitrification\Sample5\Sample_5_data\dedrift_scatter_19\',num2str(i)),'-dtiff','-r300'); 
end