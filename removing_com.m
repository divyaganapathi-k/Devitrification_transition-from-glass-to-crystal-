% % G1=zeros(max(G(:,3)),3);
% for i=1:1:max(G(:,3))
%     f=(G(:,3)==i);
%     A=G(f,:);
%     g=mean(A);
%     G1(i,:)=g(1,1:3);
% end
% clearvars -except G G1
% G1=G1(:,1:3);
% averaging=10;
% A=(1:floor(max(G1(:,3))/averaging))';
% B=repelem(A,averaging,1);
% B(length(B)+1:length(G1))=max(A)+1;
% G1=horzcat(G1,B);
% com_av(:,1)=accumarray(G1(:,4),G1(:,1),[],@mean);
% com_av(:,2)=accumarray(G1(:,4),G1(:,2),[],@mean);
% C=com_av(G1(:,4),1:2);
% G1(:,5)=G1(:,1)-C(:,1);
% G1(:,6)=G1(:,2)-C(:,2);
G2=circshift(G1,-1);
G3=G2-G1;
G3(:,3)=G2(:,3);
G3(end,1:2)=0;
G3=circshift(G3,1);
G3(:,1:2)=cumsum(G3(:,1:2));
G(:,7)=G3(G(:,3),1);
G(:,8)=G3(G(:,3),2);
G(:,7)=G(:,1)-G(:,7);
G(:,8)=G(:,2)-G(:,8);
coordinates_dedrifted=G(:,[7 8 3 4 5]);