% clearvars -except phop_all H
% A=accumarray(phop_all(:,5),1);
% B=find(A(:,1)>900);
% Lia=ismember(phop_all(:,5),B);
% phop_all=phop_all(Lia,:);
% phop_all=sortrows(phop_all,[5 4]);
% Lia=ismember(H(:,4),B);
% H=H(Lia,:);
% H=sortrows(H,[4 3]);
clearvars -except phop_all H
A=unique(phop_all(:,5));
a=0;
times=[];
for i=1:1:length(A)
    f=phop_all(:,5)==A(i);
    phop=phop_all(f,:);
    hop=smooth(phop(:,1),50);
    pks=[]; pks1=[];
    [pks(:,1),pks(:,2)]=findpeaks(hop,'minpeakheight',0.02);
    if isempty(pks)==0
        hop1=0.15-hop; 
        [pks1(:,1),pks1(:,2)]=findpeaks(hop1,'minpeakheight',0.01);
        dist1=pdist2(pks(:,2),pks(:,2),'euclidean','Smallest',2); 
        dist2=pdist2(pks1(:,2),pks(:,2),'euclidean','Smallest',1);
        if isempty(dist2)==0
            if length(pks(:,1))~=1
                dist1=dist1(2,:);
                dist1=dist1';
                dist2=dist2';
                dist2=horzcat(dist2,pks(:,2));
                B=dist1>dist2(:,1);
                dist2(:,1)=dist2(:,1).*B;
                f=dist2(:,1)~=0;
                dist2=dist2(f,:);
                ts=[];
                ts(:,1)=dist2(:,2)-dist2(:,1);
                ts(:,2)=dist2(:,2)+dist2(:,1);
                ts(:,3)=A(i);
            else
                ts=[];
                ts(:,1)=pks(:,2)-dist2;
                ts(:,2)=pks(:,2)+dist2;
                ts(:,3)=A(i);
            end
        end
    else
        continue
    end
    times=vertcat(times,ts);
end
C1=accumarray(H(:,4),H(:,3),[],@max);
f=find(C1);
D1=horzcat(C1(f),f);
C2=accumarray(H(:,4),H(:,3),[],@min);
f=find(C2);
D2=horzcat(C2(f),f);
Lia=ismember(H(:,3:4),D2,'rows');
B1=H(Lia,:);
Lia=ismember(H(:,3:4),D1,'rows');
B2=H(Lia,:);
B=[];
B=B2(:,1:2)-B1(:,1:2);
B(:,3)=(B(:,1).^2+B(:,2).^2).^(0.5);
B(:,3)=B(:,3)/38;
C=histc(B(:,3),0:0.04:1);
x=(0:0.04:1)';