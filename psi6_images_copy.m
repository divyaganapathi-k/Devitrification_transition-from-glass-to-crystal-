% clearvars
for j=1:1:1
%     load(strcat('E:\Devitrification\Experiment-1\Coordinates\Series019\Set',num2str(j),'_psi6.mat'));
    for i=1:1:5
        A=imread(strcat('C:\Users\Divya\Desktop\Images\pis6\a_878',num2str(i),'.tif'));
%         A=imread(strcat('E:\Devitrification\Experiment-1\Bandpass_data\Series019\Project-phi3-divya.lif_Series019_t',num2str(i,'%04d'),'.tif'));
        imshow(A);
        hold on
        axis equal
        axis off
        axis([0 4096 0 4096])
        k=i-46;
        f1=find(psi6_all(:,3)==k & psi6_all(:,4)<=0.5);
        scatter(psi6_all(f1,1),psi6_all(f1,2),10,'b','filled');
%         hold on
        f2=find(psi6_all(:,3)==k & psi6_all(:,4)>0.5 & psi6_all(:,4)<=0.65);
        scatter(psi6_all(f2,1),psi6_all(f2,2),10,'c','filled');
        f3=find(psi6_all(:,3)==k & psi6_all(:,4)>0.65 & psi6_all(:,4)<=0.75);
        scatter(psi6_all(f3,1),psi6_all(f3,2),10,'r','filled');
        f4=find(psi6_all(:,3)==k & psi6_all(:,4)>0.75);
        scatter(psi6_all(f4,1),psi6_all(f4,2),10,'g','filled');
        hold off
        set(gcf,'WindowStyle','docked')
        fig = gcf;
        fig.PaperPositionMode = 'auto';
%         print(strcat('E:\Devitrification\Experiment-1\psi6_images\Series019\Image_psi6\',num2str(i)),'-dtiff');
        print(strcat('C:\Users\Divya\Desktop\Test\psi6_2\',num2str(i)),'-dtiff','-r300');
%         savefig(strcat('E:\Devitrification\Experiment-1\psi6_images\Series019\Image_psi6\',num2str(i),'.fig'));
    end
%     clearvars -except j
end