% %normalization of qlms
Local_bond_ord(:,18)=(sum(((abs(Local_bond_ord(:,5:17))).^2),2)).^(0.5);
q6m=bsxfun(@rdivide,Local_bond_ord(:,5:17),Local_bond_ord(:,18));
% % %to verify for self d6 is 1
% % % product=q6m.*conj(q6m);
% % A=sum(product,2);
q6m=horzcat(Local_bond_ord(:,1:4),q6m);
clearvars -except q6m
n2=max(q6m(:,4));
n1=min(q6m(:,4));
distance=9*1.4;
solid_like=[];
%to find d6 from which solid like connections can be found for particles
for i=n1:1:n2
    f=q6m(:,4)==i;
    A=q6m(f,:);
    [B,I]=pdist2(A(:,1:3),A(:,1:3),'euclidean','Smallest',15);
    f=(B~=0 & B<=distance);
    I=I.*f;
    parfor j=1:1:length(A)
        cur_coor=A(j,:);
        C=A(nonzeros(I(:,j)),:);
        C(:,5:17)=conj(C(:,5:17));
        C(:,5:17)=bsxfun(@times,C(:,5:17),cur_coor(:,5:17));
        d6=abs(sum(C(:,5:17),2));
        f=d6>0.5;
        bonds=sum(f);
        solid_like=vertcat(solid_like,bonds);
    end
end
%six solid like connections make a particle solid
% f=solid_like<5;
% scatter3(Local_bond_ord(f,1),Local_bond_ord(f,2),Local_bond_ord(f,3),100,'b','filled');
% hold on
% axis equal
% axis off
% set(gca,'Color','k')
% f=solid_like>4 & solid_like<8;
% scatter3(Local_bond_ord(f,1),Local_bond_ord(f,2),Local_bond_ord(f,3),100,'r','filled');
% f=solid_like>7;
% scatter3(Local_bond_ord(f,1),Local_bond_ord(f,2),Local_bond_ord(f,3),100,'g','filled');
% hold off
