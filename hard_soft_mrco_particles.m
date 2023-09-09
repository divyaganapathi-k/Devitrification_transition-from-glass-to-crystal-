% f=req_coor(:,1)>190 & req_coor(:,2)>190 & req_coor(:,1)<3906 & req_coor(:,2)<3906;
% req_coor1=req_coor(f,:);
mrco_all=[];
% min(req_coor(:,3))
% max(req_coor(:,3))
for j=1:1:1
%     clearvars -except j
    hard_particles_all=[];
    soft_particles_all=[];
%     load(strcat('F:\Sample5_3D_slices\train_output_',num2str(25+(15*j)),'.mat'));
    f=req_coor(:,1)>190 & req_coor(:,2)>190 & req_coor(:,1)<3906 & req_coor(:,2)<3906;
    %for 3D 90 and 934 for 2D 190 and 3906
    req_coor1=req_coor(f,:);
    for i= min(req_coor1(:,3)):1:max(req_coor1(:,3))
    %     A=imread(strcat('E:\Devitrification\Sample_5_data\Sample5_exp2_bandpass\',num2str(i-1,'%04d'),'.tif'));
    %     imshow(A);
    %     hold on
    %     f=psi6_all(:,3)==i;
    %     B=psi6_all(f,:);
    %     B=sortrows(B,-4);
    %     B(isnan(B(:,4)),:)=[];
    %     mrco=B(1:940,:);
        f=req_coor1(:,3)==i;
        C=req_coor1(f,:);
        D=sortrows(C,-4);
        E=sortrows(C,4);
        soft_particles=D(1:2000,:);
        hard_particles=E(1:2000,:);
    %     mrco_all=vertcat(mrco_all,mrco);
        hard_particles_all=vertcat(hard_particles_all,hard_particles);
        soft_particles_all=vertcat(soft_particles_all,soft_particles);
    %     scatter(mrco(:,2),mrco(:,1),6,'g','filled');
    %     scatter(soft_particles(:,2),soft_particles(:,1),10,'r');
    %     scatter(hard_particles(:,2),hard_particles(:,1),10,'b');
    %     hold off
    %     print(strcat('E:\Devitrification\Sample_5_data\Sampe5_mrc0_hard_soft\',num2str(i-1)),'-dtiff','-r300');
    end
%     save(strcat('F:\3D_slices_new\hard_soft_1_',num2str(j)),'hard_particles_all','soft_particles_all');
end
% %     f=data(:,3)==i;
%     scatter(data(f,2),data(f,1),1,'g','filled');
% t=1:1:250;
%  parfor i=1:1:length(t)
% %     A=imread(strcat('E:\Devitrification\Sample5\Sample_5_data\Sample5_exp2_bandpass\',num2str(t(i)-1,'%04d'),'.tif'));
% %     imshow(A);
% %     hold on
% %     f=(mrco_all(:,3)==t(i));
% %     scatter(mrco_all(f,2),mrco_all(f,1),6,'g','filled');
%     f=soft_particles_all(:,3)==t(i);
%     scatter(soft_particles_all(f,2),soft_particles_all(f,1),10,'r');
%     hold on
%     f=hard_particles_all(:,3)==t(i);
%     scatter(hard_particles_all(f,2),hard_particles_all(f,1),10,'b');
%     hold off
%     print(strcat('E:\Devitrification\Sample5\Sample_5_data\Sample5_correlation1\',num2str(i-1)),'-dtiff','-r300');
%  end

% for i=1:10:2000
%     f=req_coor(:,3)==i;
%     scatter(req_coor(f,1),req_coor(f,2),10,req_coor(f,5),'filled');
%     colormap(jet)
%     caxis([-3,3]);
%     axis equal
%     axis off
%     set(gcf,'WindowStyle','docked')
%     print(strcat('D:\hard_soft_linear1\',num2str(i-1)),'-dtiff','-r300');
% end

