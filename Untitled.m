% for i=1:1:length(B)
%     j=B(i);
%     D=imread(strcat('E:\Devitrification\Images\scatter_plot\',num2str(j),'.tif'));
%     imshow(D);
%     h=gcf;
%     saveas(h,strcat('E:\Devitrification\Images\good_images_scatter_plot\',num2str(j),'.tif'));
% end

% psi6all=psi6_all;
% for i=1:1:length(drift(:,1))
%     f=(psi6_all(:,3)==i);
%     psi6_all(f,1)=psi6_all(f,1)-drift(i,1);
%     psi6_all(f,2)=psi6_all(f,2)-drift(i,2);
% end

% clearvars
% k=1;
% for j=1:1:1
%     for i=min(psi6_all(:,3)):1:max(psi6_all(:,3))
%         f1=find(psi6_all(:,3)==i & psi6_all(:,4)<=0.5);
%         scatter(psi6_all(f1,1),psi6_all(f1,2),20,'b','filled');
%         set(gca,'Ydir','reverse')
%         axis equal
%         axis off
%         hold on
%         f2=find(psi6_all(:,3)==i & psi6_all(:,4)>0.5 & psi6_all(:,4)<=0.65);
%         scatter(psi6_all(f2,1),psi6_all(f2,2),20,'r','filled');
%         f3=find(psi6_all(:,3)==i & psi6_all(:,4)>0.65 & psi6_all(:,4)<=0.75);
%         scatter(psi6_all(f3,1),psi6_all(f3,2),20,'c','filled');
%         f4=find(psi6_all(:,3)==i & psi6_all(:,4)>0.75);
%         scatter(psi6_all(f4,1),psi6_all(f4,2),20,'g','filled');
%         hold off
%         set(gcf,'WindowStyle','docked')
%         fig = gcf;
%         fig.PaperPositionMode = 'auto';
% %         print(strcat('E:\Devitrification\Experiment-1\psi6_images\Series019\Image_psi6\',num2str(i)),'-dtiff');
%         print(strcat('E:\Devitrification\Images\scatter_plot\',num2str(k)),'-dtiff');
%         k=k+1;
% %         savefig(strcat('E:\Devitrification\Experiment-1\psi6_images\Series019\Image_psi6\',num2str(i),'.fig'));
%     end
% %     clearvars -except j
% end

pos_lst_truncated=[];
for i=1:1:length(B)
    f=(pos_lst(:,5)==B(i));
    C=pos_lst(f,:);
    C(:,6)=i;
    pos_lst_truncated=vertcat(pos_lst_truncated,C);
end