pos_lst=[];
i=1;
for k=1:1:501
    A=imread(strcat('H:\Crystal2_dedrifted\Set1_bandpass\',num2str(k),'.tif'));
    A=rgb2gray(A);
    imshow(A); 
    hold on
    B=bpass(A,1,29);
%     image(B);
%     hold on
%     title(strcat('Image',num2str(k)));
     a=max(max(B));
     pk=pkfnd(B,(0.5*a),35);
% %      scatter(pk(:,1),pk(:,2),10,'g','filled');
     cnt=cntrd(B,pk,39);
     scatter(cnt(:,1),cnt(:,2),4,'r','filled');
     cnt(:,5)=i;
%      pk(:,3)=i;
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
%      pk_lst=vertcat(pk_lst,pk);
     i=i+1;
end
% %close(writerobj);
% clearvars -except pos_lst
% % to check whether there is pixel biassing or not
% hist(mod(pos_lstx,1),50);
% % h=gcf;
% % saveas(h,'pixbias_set4_oldcode.tif')
% % tracking of particles in subsequent image sequence

% to remove non centered particles
% pos_lst_sel=[];
% for i=1:1:max(pk_lst(:,3))
%     f1=(pk_lst(:,3)==i);
%     f2=(pos_lst(:,5)==i);
%     A=pk_lst(f1,:);
%     B=pos_lst(f2,:);
%     D=pdist2(A(:,1:2),B(:,1:2),'euclidean','Smallest',1);
%     f=D<=5;
%     pos_lst1=B(f,:);
%     pos_lst_sel=vertcat(pos_lst_sel,pos_lst1);
% end
param.mem=0;
param.dim=2;
param.good=10;
param.quiet=0;
R=track(pos_lst,17,param);
H=drift_loop(R(:,[1 2 5 6]),100);
% H1=drift_loop(H,10);
% H2=drift_loop(H1,100);
% clear H H1
% H=H1;
% clear H1
% 
%for 3D
% param.mem=0;
% param.dim=3;
% param.good=10;
% param.quiet=0;
% R=track(pos_lst,15,param);
% H=drift_loop(R(:,[1 2 3 4]),100);
% % H1=drift_loop(H,10);
% % H2=drift_loop(H1,100);
% % clear H
% % H=H1;
% % clear H2
% H1=drift_loop(R(:,[1 3 4 5]),100);
% % H2=drift_loop(H1,10);
% % H3=drift_loop(H2,100);
% % clear H1 H2
% H=horzcat(H(:,1:2),H1(:,2),H(:,3:4));
% clear  H1 
% % 
% %pretracking of the particles fitting gaussian for displacements between two successive images
% R1=circshift(R,-1);
% R2=R-R1;
% f=find(R2(:,3)==-1 & R2(:,4)==0);
% A=R2(f,1:2);
% edges=-12:0.1:12;
% count=histc(A(:,1),edges);
% count1=histc(A(:,2),edges);
% gfitdata=horzcat(edges',count);
% gfitdata1=horzcat(edges',count1);