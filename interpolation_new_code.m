%required inputs R R1 
%  particles with high psi6 values
% psi6_av=zeros(max(R(:,6)),1);
% parfor i=1:1:max(R(:,6))
%     f=(R(:,6)==i);
%     psi6_av(i,1)=mean(R(f,4));
% end
% 
% %particles with truncated coordinates
% psi6_av1=zeros(max(R1(:,6)),1);
% parfor i=1:1:max(R1(:,6))
%     f=(R1(:,6)==i);
%     psi6_av1(i,1)=mean(R1(f,4));
% end

%assign coordinates based on parameter memory cut off
f = find(psi6_av>=0.7);
pos_lst_add=[];
% for i=1:1:length(f)
%     f1=(R(:,6)==f(i));
%     A=R(f1,:);
%     B=circshift(A,-1);
%     C=B-A;
%     f2=find(C(:,5)>1);
%     for j=1:1:length(f2)
%         A1=A(f2,1:2);
%         A2=A((f2+1),1:2);
%     end
%     pos_lst_add=vertcat(pos_lst_add,D);
% end

for i=1:1:length(f)
    f1=(R(:,6)==f(i));
    A=R(f1,:);
    
    f2=(A(:,4)>=0.65 & A(:,7)~=1 & A(:,7)~=length(A(:,1)));
    A=A(f2,:);
    n1=min(A(:,5)); n2=max(A(:,5));
     
end

% for i=3:1:1200
%     AA=imread(strcat('E:\Devitrification\Bandpass_data\phi3\Set10\',num2str(i,'%04d'),'.tif'));
%     imshow(AA);
%     hold on
%     ff=(A(:,5)==i);
%     scatter(A(ff,1),A(ff,2),'r','filled');
% end

% % put coordinates in frames where psi6 is less than 0.7
% for i=1:1:length(A)
%     f=(R(
% end
