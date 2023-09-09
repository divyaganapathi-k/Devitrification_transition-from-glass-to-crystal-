%%
clearvars -except pos_lst
halfsigma=12;
pos_lst_corrected=[];
f=find(pos_lst(:,3)==1);
pos_lst_corrected=vertcat(pos_lst_corrected,pos_lst(f,:));
% (max(pos_lst(:,3))-1)
for i=1:1:115
    f1=find(pos_lst(:,3)==i);
    f2=find(pos_lst(:,3)==i+1);
    A=pos_lst(f1,:);
    B=pos_lst(f2,:);
    C=pdist2(A(:,1:2),B(:,1:2));
    D=[];
    if (length(f1)~=length(f2) || length(f1)<length(f2))
        parfor j=1:1:length(C(:,1))
            f=find(C(j,:)<=halfsigma & C(j,:)~=min(C(j,:)));
            f=f';
            if isempty(f)==0
               D=vertcat(D,f);
            end
        end
    end
    if isempty(D)==0
        B(D,:)=[];
    end
    pos_lst_corrected=vertcat(pos_lst_corrected,B);
end


% %%
% for i=105:1:1200
%     AA=imread(strcat('E:\Devitrification\Bandpass_data\phi3\Set10\',num2str(i,'%04d'),'.tif'));
%     figure
%     imshow(AA);
%     hold on
%     f1=find(pos_lst(:,5)==i);
%     scatter(pos_lst(f1,1),pos_lst(f1,2),10,'b','filled');
%     hold off
%     figure
%     imshow(AA);
%     hold on
%     f1=find(pos_lst_corrected(:,5)==i);
%     scatter(pos_lst_corrected(f1,1),pos_lst_corrected(f1,2),10,'b','filled');
%     hold off
% end 