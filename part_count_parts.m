%  l=1;
%  count={};
% for k=1:1:4
%     clearvars -except k l count
%     load(strcat('E:\Devitrification\Experiment-1\Coordinates\Series020\Set',num2str(k),'.mat'));
%     u=unique(coor(:,6));
%     count{k}=horzcat(u,histc(coor(:,6),u));
% end
% n1=min(coor(:,6));
%     n2=max(coor(:,6));
% for i=n1:1:n2
%         f=find(coor(:,6)==i);
%         count(l,1)=length(f);
%         l=l+1;
% end
count=zeros(51,1);
parfor i=1:1:51
    f=find(psi6_all(:,3)==i & psi6_all(:,4)>=0.9);
    count(i,1)=length(f);
end