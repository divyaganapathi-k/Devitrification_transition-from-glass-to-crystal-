com=zeros(max(psi6_all(:,3)),2);
for i=1:1:max(psi6_all(:,3))
    f=(psi6_all(:,3)==i & psi6_all(:,5)>=3);
    com(i,1)=i;
    com(i,2:3)=mean(psi6_all(f,1:2));
end