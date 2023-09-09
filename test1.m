% to find msd of spherical particles by directly importing 8bit images in their
% respective formats 
% clearvars
% close all
% % n=200;
pos_lst=[];
pos_lstx=[];
pos_lsty=[];
pos_lstt=[];
c=0;
% writerobj=VideoWriter('glass1mat.tif');
% open(writerobj);
% figure;
% for j=1:1:4
% (1+(j-1)*1000):1:(j*1000)
    coor=[];
    m=1;
for i=1:1:4000
        try
            A=imread(strcat('E:\Devitrification\Experiment-1\Bandpass_data\Series018\Project-phi3-divya.lif_Series018_t',num2str(i,'%03d'),'.tif'));
        catch
             err=1;
           break
        end
%     A=imread(strcat('C:\Users\Divya\Desktop\Test\Bandpass\psi6\',num2str(k),'.tif'));
%     A=imread(strcat('E:\Devitrification\Experiment-2\Bandpass_data\Series10\Project2-phi3-31.5deg-set2.lif_Series010_t',num2str(k-1,'%04d'),'.tif'));
%     A=imread(strcat('E:\Devitrification\Bandpass_data\phi3\Crystal_Set10_cropped\',num2str(k,'%04d'),'.tif'));
%     A=imread(strcat('E:\Devitrification\Bandpass_data\Set1\',num2str(k ,'%04d'),'.tif'));
%     imshow(A); 
%     hold on
    B=bpass(A,1,13);
%     image(B);
%     title(strcat('Image',num2str(k)));
     a=max(max(B));
     pk=pkfnd(B,(0.3*a),15);
%      scatter(pk(:,1),pk(:,2),10,'g');
     cnt=cntrd(B,pk,19);
%      scatter(cnt(:,1),cnt(:,2),10,'r','filled');
%      frame=find(Results(:,5)==k);
%      scatter(Results(frame,3),Results(frame,4),4,'g');
%      h=gcf;
%      saveas(h,strcat('E:\coding\images\Img',num2str(k),'.tif'));
%      hold off
%      f=getframe;
%      writeVideo(writerobj,f);
     pos_lstx=vertcat(pos_lstx,cnt(:,1));
     pos_lsty=vertcat(pos_lsty,cnt(:,2));
     b=length(cnt(:,1));
     for l=1:1:b
         pos_lstt(l+c)=l;  
     end
     l=l+1;
     c=length(pos_lstt);
end
% end
%close(writerobj);
% pos_lst(:,1)=pos_lstx;
% pos_lst(:,2)=pos_lsty;
% pos_lst(:,3)=pos_lstt;
%to check whether there is pixel biassing or not
% hist(mod(pos_lstx,1),50);
% h=gcf;
% saveas(h,'pixbias_set4_oldcode.tif')
%tracking of particles in subsequent image sequence
% param.mem=0;
% param.dim=2;
% param.good=10;
% param.quiet=0;
% R=track(pos_lst,10,param);

%pretracking of the particles fitting gaussian for displacements between two successive images
% R1=circshift(R,-1);
% R2=R-R1;
% f=find(R2(:,3)==-1 & R2(:,4)==0);
% A=R2(f,1:2);
% edges=-12:0.1:12;
% count=histc(A(:,1),edges);
% count1=histc(A(:,2),edges);
% gfitdata=horzcat(edges',count);
% gfitdata1=horzcat(edges',count1);