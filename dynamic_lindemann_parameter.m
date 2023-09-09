%calculation of dynamic lindemann parameter before the system shows increase in psi6
%load the dedrifted data
clearvars -except H
j=1;
sigmadip=46.6;
a=33.2;
m=1;
lindeman_parameter=zeros(500,1);
for k=1:1:4
    for l=j:j:9*j
        G=circshift(H,-l);
        A=G-H;
        f=(A(:,3)==l & A(:,4)==0);
        coor=H(f,:);
        coor(:,5)=((A(f,1)).^2+(A(f,2)).^2).^(0.5);
        lind=zeros(max(coor(:,3)),1);
        for i=1:1:max(coor(:,3))
           f=(coor(:,3)==i);
           [dist,I]=pdist2(coor(f,1:2),coor(f,1:2),'euclidean','Smallest',12);
           f1=(dist<=sigmadip);
           dist_diff=coor(I,5);
           dist_diff=reshape(dist_diff,12,sum(f));
           dist_diff=bsxfun(@minus,dist_diff,dist_diff(1,:));
           dist_diff=dist_diff.*f1;
           dist_diff=(dist_diff).^2;
%            f2=(dist_diff==0);
%            dist_diff(f2)=NaN;
           lind(i,1)=mean(nonzeros(dist_diff));
        end
        lindeman_parameter(m,1)=l;
        lindeman_parameter(m,2)=mean(lind);
        m=m+1;
    end
    j=10*j;
end