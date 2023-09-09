sigma=34.2*1.4;
for i=1:10:7741
    f=(psi6_count(:,3)==i & psi6_count(:,4)>=0.75 & psi6_count(:,7)>2);
    psi6=psi6_count(f,:);
    L=linkage(psi6(:,1:2)); % Links the particles
    C=cluster(L,'cutoff',sigma,'criterion','distance'); 
    psi6=horzcat(psi6,C);
    A=accumarray(C,1);
    A(:,2)=1:1:max(C);
    B=nonzeros((A(:,1)>2).*A(:,2)); %cluster numbers in which the size is more than 10
    f=ismember(psi6(:,8),B);
    psi6=psi6(f,:);
    f=psi6_all(:,3)==i;
    D=psi6_all(f,:);
    Lia=ismember(D(:,1:3),psi6(:,1:3),'rows');
    Lia=~Lia;
    D=D(Lia,:);
    f=D(:,4)>0.5;
    D1=D(f,:);
    f=D(:,4)<=0.5;
    D2=D(f,:);
    scatter(psi6(:,1),psi6(:,2),100,'g','filled');
    hold on
    scatter(D1(:,1),D1(:,2),100,'r','filled');
    scatter(D2(:,1),D2(:,2),100,'b','filled');
    hold off
    axis equal
    axis([700 1816 2272 3120])
    set(gcf,'WindowStyle','docked')
    print(strcat('E:\Crystal2_cropped\',num2str(i)),'-dtiff')
end