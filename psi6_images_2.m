% clearvars
k=1;
for j=1:1:1
%     load(strcat('E:\Devitrification\Experiment-1\Coordinates\Series019\Set',num2str(j),'_psi6.mat'));
% min(psi6_all(:,6))
    for i=6571:1:max(psi6_all(:,3))
%         A=imread(strcat('C:\Users\Divya\Desktop\new\Bandpass\a',num2str(i,'%03d'),'.tif'));
%         A=imread(strcat('F:\Devitrification\Bandpass_crystal_1\',num2str(i),'.tif'));
%         imshow(A);
        hold on
        patch([0 4096 4096 0], [0 0 4096 4096],'k');
        hold on
        axis([0 4096 0 4096])
        axis equal
%         axis off
        f1=(psi6_all(:,6)==i & psi6_all(:,4)<=0.5);
        scatter(psi6_all(f1,1),psi6_all(f1,2),80,'b','filled');
%        hold on
        f2=(psi6_all(:,6)==i & psi6_all(:,4)>0.5 & psi6_all(:,4)<=0.65);
        scatter(psi6_all(f2,1),psi6_all(f2,2),80,'r','filled');
        f3=(psi6_all(:,6)==i & psi6_all(:,4)>0.65 & psi6_all(:,4)<=0.75);
        scatter(psi6_all(f3,1),psi6_all(f3,2),80,'c','filled');
        f4=(psi6_all(:,6)==i & psi6_all(:,4)>0.75);
        scatter(psi6_all(f4,1),psi6_all(f4,2),80,'g','filled');
        f11=(psi6_all(:,6)==i);
        scatter(psi6_all(f11,1),psi6_all(f11,2),20,(0.1*(psi6_all(f11,3).^(0.5))),'filled');
        colormap(jet)
        hold off
        set(gcf,'WindowStyle','docked')
        fig = gcf;
        fig.PaperPositionMode = 'auto';
%         print(strcat('E:\Devitrification\Experiment-1\psi6_images\Series019\Image_psi6\',num2str(i)),'-dtiff');
        print(strcat('F:\Devitrification\scatter_psi6_crystal2_set2\',num2str(i)),'-dtiff');
        k=k+1;
%         savefig(strcat('E:\Devitrification\Experiment-1\psi6_images\Series019\Image_psi6\',num2str(i),'.fig'));
    end
%     clearvars -except j
end