sigma=38*1.2;
y=1:1:300;
clust_count=zeros(100,1);
nn_count=zeros(200,1);
for i=1:1:1
    f=(psi6_count(:,3)==i);
    psi6=psi6_count(f,1:4);
    L=linkage(psi6(:,1:2)); % Links the particles
    C=cluster(L,'cutoff',sigma,'criterion','distance'); 
    psi6=horzcat(psi6,C);
    A=accumarray(C,1);
    A(:,2)=1:1:max(C);
    B=nonzeros((A(:,1)>10).*A(:,2)); %cluster numbers in which the size is more than 10
    f=ismember(psi6(:,5),B);
    psi6=psi6(f,:);
end