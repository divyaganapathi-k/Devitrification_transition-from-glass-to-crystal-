% clearvars -except psi6_all psi6_time pos_lst
% f= psi6_time(:,2)<0.7;
% A=psi6_time(f,1);
% B=ismember(pos_lst(:,5),A);
% f=find(B);
% pos1=pos_lst(f,[1 2 5]);
% pos=vertcat(psi6_all(:,1:3),pos1);

%this code to be used only after crystallinity has come into picture
% clearvars -except psi6_all psi6_time pos_lst
f1= psi6_time(:,2)<=0.7;
f2=~f1;
A= psi6_time(f1,1); % contains high psi6 time images
B= psi6_time(f2,1);
% count1= zeros(length(A),1);
% count11= zeros(length(A),1);
% count2= zeros(length(B),1);
% count22= zeros(length(B),1);
% parfor i=1:1:length(A)
%     f= psi6_all(:,3)==A(i);
%     C=psi6_all(f,4);
%     ff= C>0.7;
%     count1(i)= sum(f);
%     count11(i)= sum(ff);
% end
% 
% parfor i=1:1:length(B)
%     f= psi6_all(:,3)==B(i);
%     C=psi6_all(f,4);
%     ff= C>0.7;
%     count2(i)= sum(f);
%     count22(i)= sum(ff);
% end

%interpolation and removal of old coordinates
% for i=2:1:length(A)
%     f= psi6_all(:,3)==A(i);
%     C= psi6_all(f,:);
%     if ismember(A(i)-1,A)==0 && ismember(A(i)+1,A)==0
%         f1= (psi6_all(:,3)==A(i)-1 & psi6_all(:,4)>=0.7);
%         f2= (psi6_all(:,3)==A(i)+1 & psi6_all(:,4)>=0.7);
%         C1= psi6_all(f1,:);
%         C2= psi6_all(f2,:);
%     [D1, D2]= pdist2(C(:,1:2),C1(:,1:2),'euclidean','Smallest',1);
%     [D3, D4]= pdist2(C(:,1:2),C2(:,1:2),'euclidean','Smallest',1);
%     [D5, D6]= pdist2(C2(:,1:2),C1(:,1:2),'euclidean','Smallest',1);
%     else
%         continue
%     end
%     
% end