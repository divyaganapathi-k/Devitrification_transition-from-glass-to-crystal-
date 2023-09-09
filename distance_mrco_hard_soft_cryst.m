% n=2000;
% sigma=37.8;
% distance=sigma;
% distances_all_hard=[];
% parfor i=1:1:n
%     f=hard(:,3)==i;
%     A=hard(f,:);
%     f=mrco2(:,3)==i;
%     B=mrco2(f,:);
%     C=pdist2(B(:,1:2),A(:,1:2),'euclidean','Smallest',1);
%     distances_all_hard=vertcat(distances_all_hard,C');
% end
% distances_all_hard=distances_all_hard/distance;
% x=min(distances_all_hard):1:max(distances_all_hard);
% hist_distances_hard=histcounts(distances_all_hard,x);
% hist_distances_hard=(hist_distances_hard/sum(hist_distances_hard))';
% % 
% n=2000;
% sigma=37.8;
% distance=sigma;
% distances_all_soft=[];
% parfor i=1:1:n
%     f=soft(:,3)==i;
%     A=soft(f,:);
%     f=mrco2(:,3)==i;
%     B=mrco2(f,:);
%     C=pdist2(B(:,1:2),A(:,1:2),'euclidean','Smallest',1);
%     distances_all_soft=vertcat(distances_all_soft,C');
% end
% distances_all_soft=distances_all_soft/distance;
% x=min(distances_all_soft):1:max(distances_all_soft);
% hist_distances_soft=histcounts(distances_all_soft,x);
% hist_distances_soft=(hist_distances_soft/sum(hist_distances_soft))';
% 
% sigma=37.8;
% distance=sigma;
% distances_all_hard=[];
% C=pdist2(psi6_count1(:,8:9),hard(:,6:7),'euclidean','Smallest',1);
% distances_all_hard=C'/distance;
% x=min(distances_all_hard):1:max(distances_all_hard);
% hist_distances_hard=histc(distances_all_hard,x);
% distances_all_soft=[];
% C=pdist2(psi6_count1(:,8:9),soft(:,6:7),'euclidean','Smallest',1);
% distances_all_soft=C'/distance;
% x=min(distances_all_soft):1:max(distances_all_soft);
% hist_distances_soft=histc(distances_all_soft,x);
% distances_all_mrco=[];
% C=pdist2(psi6_count1(:,8:9),mrco2(:,7:8),'euclidean','Smallest',1);
% distances_all_mrco=C'/distance;
% x=min(distances_all_mrco):1:max(distances_all_mrco);
% hist_distances_mrco=histc(distances_all_mrco,x);
% % 
% f=psi6_count(:,3)==12233;
% psi6_count1=psi6_count(f,:);
% L=linkage(psi6_count1(:,8:9)); % Links the particles
% C=cluster(L,'cutoff',sigma,'criterion','distance'); 
% psi6_count1=horzcat(psi6_count1,C);
% A=accumarray(C,1);
% A(:,2)=1:1:max(C);
% B=nonzeros((A(:,1)>5).*A(:,2)); %cluster numbers in which the size is more than 10
% f=ismember(psi6_count1(:,10),B);
% psi6_count1=psi6_count1(f,:);

sigma=41;
distance=sigma;
L=linkage(AA4(:,1:2)); % Links the particles
C=cluster(L,'cutoff',sigma,'criterion','distance'); 
AA4=horzcat(AA4,C);
A=accumarray(C,1);
A(:,2)=1:1:max(C);
B=nonzeros((A(:,1)>5).*A(:,2)); %cluster numbers in which the size is more than 10
f=ismember(AA4(:,20),B);
AA5=AA4(f,:);x=0:1:20;
distances_all_hard=[];
C=pdist2(AA5(:,1:2),hard(:,5:6),'euclidean','Smallest',1);
distances_all_hard=C'/distance;
hist_distances_hard=histcounts(distances_all_hard,x);
hist_distances_hard=(hist_distances_hard/sum(hist_distances_hard))';
distances_all_soft=[];
C=pdist2(AA5(:,1:2),soft(:,5:6),'euclidean','Smallest',1);
distances_all_soft=C'/distance;
hist_distances_soft=histcounts(distances_all_soft,x);
hist_distances_soft=(hist_distances_soft/sum(hist_distances_soft))';
distances_all_mrco=[];
C=pdist2(AA5(:,1:2),mrco2(:,7:8),'euclidean','Smallest',1);
distances_all_mrco=C'/distance;
hist_distances_mrco=histcounts(distances_all_mrco,x);
hist_distances_mrco=(hist_distances_mrco/sum(hist_distances_mrco))';