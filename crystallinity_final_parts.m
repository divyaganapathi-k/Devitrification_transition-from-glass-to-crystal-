%%
% % pos_lst=H;
% clearvars -except pos_lst
% f=find(pos_lst(:,2)<=320);
% pos_lst=pos_lst(f,:);
% load('E:\Devitrification\Coordinates\Set1.mat');
%     sigma=17.6;
% pos_lst=H;
% f=(data(:,5)<0.2);
% data=data(f,:);
% pos_lst=data(f,[1 2 9]);
% clearvars -except pos_lst
% distance=38*1.4;
% % distance=18*1.4;
% for k=1:1:1
% %     pos_lst=[];
% %     load(strcat('F:\3D_slices_new\3_',num2str(k)));
% %     distance=18*1.4;
%     time=3;
%     % % % n1=min(pos_lst(:,time));
%     % % % n2=max(pos_lst(:,time));
%     % % % % n=200;
%     % % % % psi6_time=zeros(n2-n1+1,2);
%     psi6_all=[];
%     l=1;
% %     min(pos_lst(:,time))
% % max(pos_lst(:,time))
%     for i=1:1:length(pos_lst(:,time))
%         psi6_frame=[];  %#ok<NASGU>
%         f=(pos_lst(:,time)==i);
%         %     A=R(f,[1 2 6 7]);
%         A=pos_lst(f,:);
%         TRI=delaunay(A(:,1),A(:,2));
%         %     %visualizing delaunay
%         %     AA=imread(strcat('E:\Devitrification\Bandpass_data\phi3\Crystal_Set10_cropped\',num2str(i,'%04d'),'.tif'));
%         %     imshow(AA);
%         %     hold on
%         %     triplot(TRI,A(:,1),A(:,2));
%         %     hold off
%         psi6=zeros(length(A(:,1)),1);
%         psi6_complex=zeros(length(A(:,1)),1);
%         count=zeros(length(A(:,1)),1);
%         parfor j=1:1:length(A(:,1))
%             f1=(any((TRI==j),2));
%             B=unique(TRI(f1,:)); %contains indices of neighbours
%             C=A(B,1:2); %#ok<*PFBNS>
%             D=A(j,1:2);
%             C(:,1)=C(:,1)-D(1,1);
%             C(:,2)=C(:,2)-D(1,2);
%             C(:,3)=(C(:,1).^2+C(:,2).^2).^(0.5);
%             C(:,4)=atan2((C(:,1)),(C(:,2)));
%             %distance cutoff
%             f2=(C(:,3)~=0 & C(:,3)<=distance);
%             E=[];
%             E(:,1)=(exp(4i.*C(f2,4)));
%             g=mean(E);
%             psi6_complex(j,1)=g;
%             psi6(j,1)=abs(g);
%             count(j,1)=sum(f2);
%         end
%     %     F1=(isnan(psi6)==0);
%     %     G1=psi6(F1,1);
%         psi6_time(l,1)=i;
%         psi6_time(l,2)=nanmean(psi6,1);
%         l=l+1;
%         psi6_frame=horzcat(A(:,[1 2 time]),psi6,count,psi6_complex);
%     %     psi6_frame(:,6)=i;
%         psi6_all=vertcat(psi6_all,psi6_frame);
%     end
% %     save(strcat('F:\3D_slices_new\psi6_3_',num2str(k)),'psi6_all','psi6_time');
% end
% save('E:\Devitrification\Experiment-1\Coordinates\Series020\eric_psi6_020.mat', 'psi6_all','psi6_time');

%%
% for k=1:1:56
% %     AA=imread(strcat('C:\Users\Divya\Desktop\Test\Experiment-5\Bandpass_data\',num2str((k*10)+6),'.tif'));
% %     AA=imread(strcat('C:\Users\Divya\Desktop\new\Bandpass_data\Project_new_sample_3.lif_Series089_t',num2str((k-1)*10,'%04d'),'.tif'));
% %     imshow(AA);
% %     hold on
%     f=find(psi6_all(:,4)>=0.85 & psi6_all(:,5)>=4 & psi6_all(:,3)==k);
% %     scatter(psi6_all(f,1),psi6_all(f,2),10,'b','filled');
% % %     f1=find(crystal_count(:,5)==k);
% % %     scatter(crystal_count(f1,3),crystal_count(f1,4),20,'r');
% %     hold off
% %     set(gcf,'WindowStyle','docked')
% %     fig = gcf;
% %     fig.PaperPositionMode = 'auto';
% % %     print(strcat('C:\Users\Divya\Desktop\new\scatter\',num2str(k)),'-dtiff','-r300');
% % end
% % 
% % %%
% % crystal_number=zeros(max(psi6_all(:,6)),3);
% % l=2375;
% % for i=1:1:max(psi6_all(:,6))
%     f=(psi6_all(:,4)>=0.7 & psi6_all(:,5)>=4 & psi6_all(:,6)==i);
%     f1=(psi6_all(:,6)==i);
%     crystal_number(l,1)=l;
%     crystal_number(l,2)=sum(f);
%     crystal_number(l,3)=sum(f1);
%     l=l+1;
% end
% % 
% %%
% psi6_time=zeros(max(psi6_all(:,3)),2);
% j=1;
% for i=1:20:max(psi6_all(:,3))
%     f=find(psi6_all(:,3)==i);
%     psi6_time(j,1)=i;
%     psi6_time(j,2)=nanmean(psi6_all(f,4));
%     j=j+1;
% end
% % 
% % % %%
% % B2=accumarray(psi6_all(:,4),1);
psi6_all1=psi6_all;
f=(psi6_all(:,4)>0.6 & psi6_all1(:,5)>2);
psi6_all1=psi6_all1(f,:);
psi6_count=[];
distance=38*1.2;
% max(psi6_all1(:,3))
for i=1:1:max(psi6_all1(:,3))
    f=(psi6_all1(:,3)==i);
    A=psi6_all1(f,:);
    D=pdist2(A(:,1:2),A(:,1:2),'euclidean','Smallest',16);
    f=(D<=distance & D~=0);
    f=sum(f,1);
%     f=reshape(f,size(D));
%     B=sum(f);
    psi6_count=vertcat(psi6_count,horzcat(A,f'));
end
% % [~,ia,ib]=intersect(psi6_count(:,1:3),dedrift_coordinates(:,[4 5 3]),'rows');
% % psi6_count = horzcat(psi6_count(ia,:),dedrift_coordinates(ib,1:2));
% % % f=psi6_count(:,7)>0;
% % psi6_count=psi6_count(f,:);
% % % B1=accumarray(psi6_count(:,4),1);
% % cryst_part=zeros(12235,1);
% % parfor i=1:1:12235
% %     f=psi6_count(:,3)==i;
% %     cryst_part(i,1)=sum(f);
% % end
% % %   
% j=1;
% % psi6_time=zeros(774,2);
% for i=01:1:7741
%     f=psi6_all1(:,3)==i;
%     psi6_time(j,1)=i;
%     psi6_time(j,2)=nanmean(psi6(f,4));
%     j=j+1;
% end