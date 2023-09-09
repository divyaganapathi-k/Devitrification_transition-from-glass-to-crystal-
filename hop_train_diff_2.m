%for hard particles
A=accumarray(phop_all(:,5),1);
f=find(A>5);
B=ismember(f,phop_all(:,5));
phop_req=phop_all(B,:);
phop_req=sortrows(phop_req,[5 4]);
phop_req(:,6)=smooth(phop_req(:,1));
A=accumarray(phop_req(:,5),phop_req(:,6),[],@mean);
f=A<0.09 & A~=0;