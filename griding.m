clearvars -except psi6_all
psi6=zeros(132,256);
k=1;
l=1;
sz=256;
div=16;
a=6;
b=4;
for i=1:1:div
    for j=1:1:div
        f=(psi6_all(:,1)>=((i-1)*sz) & psi6_all(:,1)<(i*sz) & psi6_all(:,2)>=((j-1)*sz) & psi6_all(:,2)<(j*sz));
        A=psi6_all(f,:);
        for t=1:50:max(psi6_all(:,a))
            f1=(A(:,a)==t);
            psi6(k,l)=nanmean(A(f1,b));
            k=k+1;
%             sum(f1)
        end
        l=l+1;
        k=1;
    end
end
tvec=(1:50:max(psi6_all(:,6)))';
psi6=horzcat(tvec,psi6);
z=1:1:div;
mat=[];
mat(:,1)=(repelem(z,div))';
mat(:,2)=(repmat(z,1,div))';
%  i=7; j=5;
% f=(ex_ent(:,1)>=((i-1)*512) & ex_ent(:,1)<(i*512) & ex_ent(:,2)>=((j-1)*512) & ex_ent(:,2)<(j*512));
% x_ent=ex_ent(f,:);
% excess_entropy=zeros(670,1);
% k=1;
%  for i=1:10:max(x_ent(:,5))
%      f1=(x_ent(:,5)==i);
%      excess_entropy(k,1)=nanmean(x_ent(f1,4));
%      k=k+1;
%  end
%marking the grid lines on the image

