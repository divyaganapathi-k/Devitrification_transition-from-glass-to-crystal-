% clearvars -except pos_lst
distance=27;
% %calculating psi6 complex for all the particles
% % max(pos_lst(:,5))
psi6_complex=[];
for i=1:1: max(pos_lst(:,5))
    f=(pos_lst(:,5)==i);
    A=pos_lst(f,[1 2 5]);
    TRI=delaunay(A(:,1),A(:,2));
    complex=zeros(length(A(:,1)),1);
    len=zeros(length(A(:,1)),1);
    parfor j=1:1:length(A(:,1))
        f1=(any((TRI==j),2));
        B=unique(TRI(f1,:)); %contains indices of neighbours
        C=A(B,1:2); %#ok<*PFBNS>
        D=A(j,1:2);
        C(:,1)=C(:,1)-D(1,1);
        C(:,2)=C(:,2)-D(1,2);
        C(:,3)=(C(:,1).^2+C(:,2).^2).^(0.5);
        C(:,4)=atan2((C(:,1)),(C(:,2)));
        %distance cutoff
        f2=(C(:,3)~=0 & C(:,3)<=distance);
        E=[];
        E(:,1)=(exp(6i.*C(f2,4)));
        F= isnan(E)==0;
        G=E(F,1);
        complex(j,1)=mean(G);
        len(j,1)=length(f2);
    end
    A=horzcat(A,complex,len); %#ok<AGROW>
    psi6_complex=vertcat(psi6_complex,A); %#ok<AGROW>
end
% t=25;
% [C,ia,ib]=intersect(psi6_complex1(:,1:2),R(:,1:2),'rows');
% psi6_complex=psi6_complex1(ia,:);
% psi6_complex(:,6)=R(ib,6);
% psi6_complex=sortrows(psi6_complex,6);
% clearvars -except psi6_complex
% A=circshift(psi6_complex,-t);
% B=A-psi6_complex;
% X=(B(:,6)==0 & B(:,3)==t);
% req_mat=psi6_complex(X,:);
% req_mat(:,7)=A(X,4);
% req_mat(:,8)=conj(req_mat(:,4)).*req_mat(:,7);
% time=1:1:max(psi6_complex(:,3));
% bond_corr=accumarray(time,req_mat(:,8),[],@mean);