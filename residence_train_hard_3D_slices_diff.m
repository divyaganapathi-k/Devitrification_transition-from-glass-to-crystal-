pth=0.0175;
phop_required=[];
for i=min(phops(:,6)):1:max(phops(:,6))
    f=phops(:,6)==i;
    phop_all=phops(f,1:5);
    phop_all=sortrows(phop_all,[5 4]);
    % phop_all1=[];
    phop_all1=phop_all;
    % A=accumarray(phop_all(:,5),1);
    % f=find(A>10);
    % B=ismember(phop_all(:,5),f);
    % phop_all1=phop_all(B,:);

    % A=accumarray(phop_all1(:,5),1);
    % A=nonzeros(A);
    % D=horzcat(D,A);
    pks=[];
    phop_all1(:,6)=smooth(phop_all(:,1),15);
    phop_all2=sortrows(phop_all1,[5 -4]);
    [~,ia,~]=unique(phop_all2(:,5));
    D=phop_all2(ia,[6 4 5]); % end of trajectory
    % f=D(:,1)<=0.04;
    % D=D(f,:);
    [pks(:,1),pks(:,2)]=findpeaks(phop_all1(:,6));
    E=horzcat(pks(:,1),phop_all1(pks(:,2),4:5));
    f=E(:,1)>pth;
    E=E(f,:); % required peaks
    F=accumarray(phop_all1(:,5),phop_all1(:,6),[],@max);
    f=find(F);
    G=horzcat(nonzeros(F),f); % maximum values of the trajectories
    [~,ia,ib]=intersect(G,phop_all1(:,[6 5]),'rows');
    I=horzcat(G(ia,:),phop_all1(ib,4));
    f=I(:,1)>pth;
    I=I(f,:);
    I=I(:,[1 3 2]);
    E=vertcat(E,I,D); %contains all the maximum values possible and trajectory ends
    E=unique(E,'rows');
    E=sortrows(E,[3 2]);
    J=circshift(E,-1);
    K=J-E;
    f=(K(:,3)==0);
    phop_required1=horzcat(K(f,2),E(f,:));
    [C,~,ib]=intersect(phop_required1(:,2:4),phop_all1(:,[6 4 5]),'rows');
    phop_required1=phop_all1(ib,1:6);
    phop_required1(:,7)=i;
    phop_required=vertcat(phop_required,phop_required1);
end
phop_required=sortrows(phop_required,-6);
phop_required=phop_required(1:600,:);
[~,ia,ib]=intersect(phop_required(:,[2 3 4 5 7]),H,'rows');
req_coord_hard=horzcat(R(ib,1:2),phop_required(ia,[4 5 7]));
[~,ia,ib]=intersect(req_coord_hard(:,[1 2 3 5]),radial_density(:,1:4),'rows');
req_coord_hard=horzcat(req_coord_hard(ia,:),radial_density(ib,5:end));
req_coord_hard(:,end+1)=-1;
