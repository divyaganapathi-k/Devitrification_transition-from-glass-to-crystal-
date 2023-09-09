k=1;
time=3;
psi6=4;
% % for j=1:25:max(psi6_all(:,3))
% %     load(strcat('E:\Devitrification\Experiment-1\Coordinates\Series019\Set',num2str(j),'_psi6.mat'));
% % min(psi6_all(:,6))
% for i=1:1:12235
% %         A=imread(strcat('C:\Users\Divya\Desktop\new\Bandpass\a',num2str(i,'%03d'),'.tif'));
% %         A=imread(strcat('E:\Devitrification\Sample5_exp2_bandpass\',num2str(i-1,'%04d'),'.tif'));
% %         imshow(A);
% %         hold on
%     patch([0 4300 4300 0], [0 0 4300 4300],'k');
% %         patch([1250 1850 1850 1250],[2250 2250 2750 2750],'k');
%     hold on
%     axis([0 4300 0 4300])
%     axis equal
%     axis off
%     f=req_coor(:,3)==i;
%     scatter(req_coor(f,5),req_coor(f,6),6,req_coor(f,4),'filled');
%     colormap(jet)
%     caxis([-3 3]);
%     f=psi6_count(:,3)==i;
%     scatter(psi6_count(f,8),psi6_count(f,9),3,'w','filled');
%     hold off
%     set(gcf,'WindowStyle','docked')
%     fig = gcf;
%     print(strcat('E:\hard_soft_crystal_particles\',num2str(i)),'-dtiff','-r300');
% % %         print(strcat('C:\Users\Divya\Desktop\Crystal3\psi63\',num2str(i)),'-dtiff','-r300');
% %         k=k+1;
%     close all
% %         savefig(strcat('E:\Devitrification\Experiment-1\psi6_images\Series019\Image_psi6\',num2str(i),'.fig'));
% end
% %     clearvars -except j
% % end
% 

for i=1:1:12235
    patch([0 4300 4300 0], [0 0 4300 4300],'k');
    hold on
    axis([0 4300 0 4300])
    axis equal
    axis off
    f=pos_lst(:,3)==i;
    scatter(pos_lst(f,1),pos_lst(f,2),6,'w','filled');
    f=soft_particles_all(:,3)==i;
    scatter(soft_particles_all(f,5),soft_particles_all(f,6),5,'r','filled');
    f=hard_particles_all(:,3)==i;
    scatter(hard_particles_all(f,5),hard_particles_all(f,6),5,'b','filled');
    caxis([-3 3]);
    f=psi6_count(:,3)==i;
    scatter(psi6_count(f,8),psi6_count(f,9),3,'g','filled');
    hold off
    set(gcf,'WindowStyle','docked')
    fig = gcf;
    print(strcat('F:\Sample5_hard_soft_cryst1\',num2str(i)),'-dtiff','-r300');
% %         print(strcat('C:\Users\Divya\Desktop\Crystal3\psi63\',num2str(i)),'-dtiff','-r300');
%         k=k+1;
    close all
%         savefig(strcat('E:\Devitrification\Experiment-1\psi6_images\Series019\Image_psi6\',num2str(i),'.fig'));
end
%     clearv