% to find msd of spherical particles by directly importing 8bit images in their
% respective formats 
clearvars
% close all
% % n=200;
pos_lst=[];
% % % % % % % % c=0;
i=1;
% % % % % % j=1;
for k=1:1:1
    for i=1:1:21
        A=imread(strcat('I:\Sample5_double\Sample5_exp2_zstack_Series003_t',num2str(k,'%04d'),'_z',num2str(10+(i*10),'%03d'),'.tif'));
    %     A=imread(strcat('E:\Devitrification\Sample5_exp2_bandpass\',num2str(k-1,'%04d'),'.tif'));
    %     A=imread(strcat('C:\Users\data\Desktop\t',num2str(k,'%03d'),'_z040_c1.tif'));
    %     A=imread(strcat('E:\Devitrification\Crystal1_new\Raw_Data\Crystal1_zstack_new.lif_Series010_t',num2str(j-1,'%03d'),'_z',num2str(k-1,'%03d'),'.tif'));
    %     A=imread(strcat('F:\manasa_gb_data\25deg_inttime_BP\',num2str(k-1),'.tif'));
    %     A=rgb2gray(A);
    %     figure
    %     imshow(A); 
    %     hold on
        B=bpass(A,1,11);
    %     image(B);
    %     hold on
    %     title(strcat('Image',num2str(k)));
         a=max(max(B));
         pk=pkfnd(B,(0.5*a),15);
    %      scatter(pk(:,1),pk(:,2),10,'g');
         cnt=cntrd(B,pk,19);
    %      scatter(cnt(:,1),cnt(:,2),9,'g','filled');
         cnt(:,5)=i;
    %      frame=find(Results(:,5)==k);
    %      scatter(Results(frame,3),Results(frame,4),4,'g');
    %      h=gcf;
    %      saveas(h,strcat('E:\coding\images\Img',num2str(k),'.tif'));
    %      hold off
    %      f=getframe;
    %      writeVideo(writerobj,f);
    %      pos_lstx=vertcat(pos_lstx,cnt(:,1));
    %      pos_lsty=vertcat(pos_lsty,cnt(:,2));
         pos_lst=vertcat(pos_lst,cnt);
%      i=i+1;
    end
end
