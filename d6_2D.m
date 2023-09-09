% % psi6_complex(:,7)=abs(psi6_complex(:,6));
% psi6_complex(:,7)=psi6_complex(:,5)./psi6_complex(:,4);
% k=12;
% distance=51.4;
% psi6_complex_modified=[];
% for i=1:1:max(psi6_complex(:,3))
%     f=(psi6_complex(:,3)==i);
%     A=psi6_complex(f,:);
%     [B,I]=pdist2(A(:,1:2),A(:,1:2),'euclidean','Smallest',k); 
%     f=(B<=distance & B~=0);
%     J=A(I,7);
%     J=reshape(J,size(I));
%     J1=conj(J);
%     J2=bsxfun(@times,J(1,:), J1); 
%     f=double(f);
%     f(f==0)=NaN;
%     J2=J2.*f;
% %     J3=abs(J2);
%     J3=real(J2);
%     f=(J3>=0.7);
%     J4=sum(f);
%     A=horzcat(A,J4');
%     psi6_complex_modified=vertcat(psi6_complex_modified,A);
% end

psi6_complex_modified=final_coor;
% clearvars -except psi6_all
k=1;
time=3;
psi6=4;
cryst=8;
for i=38:1:max(psi6_complex_modified(:,time))
    patch([0-100 4096+100 4096+100 0-100], [0-100 0-100 4096+100 4096+100],'k');
%         patch([1250 1850 1850 1250],[2250 2250 2750 2750],'k');
    hold on
%         axis([0 4096 0 4096])
    axis equal
    axis off
    f1=(psi6_complex_modified(:,time)==i & psi6_complex_modified(:,psi6)>=0.7 & psi6_complex_modified(:,cryst)>=3);
    scatter(psi6_complex_modified(f1,1),psi6_complex_modified(f1,2),10,'g','filled');
%     f1=~f1;
% %     f2=(psi6_complex_modified(:,time)==i & psi6_complex_modified(:,cryst)<=3);
%    scatter(psi6_complex_modified(f1,1),psi6_complex_modified(f1,2),1,[0.5 0.5 0.5],'filled');
%     scatter(psi6_complex_modified(f2,1),psi6_complex_modified(f2,2),1,'MarkerFaceColor','k','MarkerEdgeColor','k','MarkerFaceAlpha',.3,'MarkerEdgeAlpha',.3);
    hold off
    set(gcf,'WindowStyle','docked')
    fig = gcf;
    fig.PaperPositionMode = 'auto';
    print(strcat('C:\Users\Divya\Desktop\',num2str(i)),'-dtiff','-r300');
    close all
end
% psi6_complex=psi6_complex_modified;
% psi6_complex(:,8)=psi6_complex_modified(:,8);
% f=(psi6_complex(:,8)>=4);
% psi6_complex=psi6_complex(f,:);
% f=(psi6_complex(:,4)>0.75);
% psi6_complex=psi6_complex(f,:);
% y=1:1:200;
% clust_count=zeros(100,1);
% nn_count=zeros(200,1);
% n=max(psi6_complex(:,3));
% sigma=51.6;
% final_coor=[];
% for i=1:1:n
%     f=(psi6_complex(:,3)==i);
%     req_coor=psi6_complex(f,:);
%     L=linkage(req_coor(:,1:2)); % Links the particles
%     C=cluster(L,'cutoff',sigma,'criterion','distance'); 
%     req_coor=horzcat(req_coor,C);
%     num=max(C);
%     x=1:1:num;
%     A=histc(C,x);
%     f=(A(:,1)>4);
%     B=nonzeros(f.*x'); %cluster numbers in which the size is more than 4
%     D=ismember(C,B);
%     F=req_coor(:,1).*D;
%     f=(F~=0);
%     req_coor=req_coor(f,:);
%     final_coor=vertcat(final_coor,req_coor);
% end
% no_of_cryst_part=zeros((max(final_coor(:,3))),2);
% no_of_cryst_part(:,1)=1:max(final_coor(:,3));
% for i=1:1:n
%     f=(final_coor(:,3)==i);
%     no_of_cryst_part(i,2)=sum(f);
% end