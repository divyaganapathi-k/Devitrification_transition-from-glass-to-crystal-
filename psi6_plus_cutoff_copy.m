% crystal_count=[];
% f=unique(psi6_all(:,3));
% time=sort(f);
% for i=1:1:length(time)
%     f=find(psi6_all(:,3)==time(i,1));
%     A=psi6_all(f,:);
%     B=delaunay(A(:,1),A(:,2));
%     E=zeros(length(A(:,1)),5);
%     for j=1:1:length(A(:,1))
%         f1=(any((B==j),2));
%         C=unique(B(f1,:)); %contains indices of neighbours
%         f2= C~=j;
%         D=A(C(f2),:); % contains coordinates and psi6 of neighbours
%         D(:,5)=((A(j,1)-D(:,1)).^(2)+(A(j,2)-D(:,2)).^(2)).^(0.5);
%         f3=find(D(:,4)>=0.7 & D(:,5)<=17.13);
%         E(j,1)=A(j,4);
%         E(j,2)=length(f3);
%         E(j,3)=A(j,1);
%         E(j,4)=A(j,2);
%     end
%     E(:,5)=time(i,1);
%     crystal_count=vertcat(crystal_count,E);
% end

for k=1:1:5
%     figure
%     AA=imread('C:\Users\Divya\Desktop\Test\Bandpass_data\Project_Series028_t0010.tif');
    AA=imread(strcat('C:\Users\Divya\Desktop\Images\psi6\a_878',num2str(k-1),'.tif'));
    imshow(AA);
    hold on
    f=find(crystal_count(:,1)>=0.85 & crystal_count(:,2)>=6 & crystal_count(:,5)==k);
    scatter(crystal_count(f,3),crystal_count(f,4),10,'b','filled');
%     f1=find(crystal_count(:,5)==k);
%     scatter(crystal_count(f1,3),crystal_count(f1,4),20,'r');
    hold off
%     figure
%     BB=imread('C:\Users\Divya\Desktop\Test\Bandpass_data1\970.tif');
%     imshow(BB);
%     hold on
%     f=find(E2(:,1)>=0.85 & E2(:,2)>=4);
%     scatter(E2(f,3),E2(f,4),10,'b','filled');
%     hold off
    print(strcat('C:\Users\Divya\Desktop\Images\crystalline_particles\',num2str(k)),'-dtiff','-r300');
end
% crystal_number=zeros(5,2);
% l=1;
% for i=1:1:5
%     f=find(crystal_count(:,1)>=0.85 & crystal_count(:,2)>=4 & crystal_count(:,5)==i);
%     crystal_number(l,1)=l;
%     crystal_number(l,2)=length(f);
%     l=l+1;
% end