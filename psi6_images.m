% psi6_all=G;
% clearvars -except psi6_all
k=1;
time=3;
psi6=4;
% for j=1:25:max(psi6_all(:,3))
%     load(strcat('E:\Devitrification\Experiment-1\Coordinates\Series019\Set',num2str(j),'_psi6.mat'));
% min(psi6_all(:,6))
    for i=1:1:max(psi6_all(:,time))
%         A=imread(strcat('C:\Users\Divya\Desktop\new\Bandpass\a',num2str(i,'%03d'),'.tif'));
%         A=imread(strcat('E:\Devitrification\Sample5_exp2_bandpass\',num2str(i-1,'%04d'),'.tif'));
%         imshow(A);
%         hold on
        patch([0 4300 4300 0], [0 0 4300 4300],'k');
%         patch([1250 1850 1850 1250],[2250 2250 2750 2750],'k');
        hold on
        axis([0 4300 0 4300])
        axis equal
        axis off
        f=psi6_all(:,time)==i;
        A=psi6_all(f,:);
        f1=(A(:,psi6)<=0.6);
        scatter(A(f1,7),A(f1,8),4.5,'b','filled');
        hold on
        f2=(A(:,psi6)>0.6 & A(:,psi6)<=0.75);
        scatter(A(f2,7),A(f2,8),4.5,'r','filled');
        f3=(A(:,psi6)>0.75 & A(:,psi6)<=0.9);
        scatter(A(f3,7),A(f3,8),4.5,'c','filled');
        f4=(A(:,time)==i & A(:,psi6)>0.9);
        scatter(A(f4,7),A(f4,8),4.5,'g','filled');
%         f11=(psi6_all(:,6)==i);
%         scatter(psi6_all(f11,1),psi6_all(f11,2),20,(0.1*(psi6_all(f11,3).^(0.5))),'filled');
%         colormap(jet)
        hold off
        set(gcf,'WindowStyle','docked')
        fig = gcf;
        fig.PaperPositionMode = 'auto';
        print(strcat('D:\Sample5_2D_data\Sample5_crystallinity\',num2str(i)),'-dtiff','-r300');
% %         print(strcat('C:\Users\Divya\Desktop\Crystal3\psi63\',num2str(i)),'-dtiff','-r300');
%         k=k+1;
        close all
%         savefig(strcat('E:\Devitrification\Experiment-1\psi6_images\Series019\Image_psi6\',num2str(i),'.fig'));
    end
%     clearvars -except j
% end