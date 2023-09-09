
y=1:1:200;
clust_count=zeros(100,1);
nn_count=zeros(200,1);
for i=1:1:n
    f=(mostmobile(:,4)==i);
    most_mob=mostmobile(f,2:3);
    L=linkage(most_mob); % Links the particles
    C=cluster(L,'cutoff',sigma,'criterion','distance'); 
    most_mob=horzcat(most_mob,C);
    num=max(C);
    x=1:1:num;
    A=histc(C,x);
    f=(A(:,1)>4);
    B=nonzeros(f.*x'); %cluster numbers in which the size is more than 4
    D=ismember(C,B);
    E=D.*most_mob(:,1);
    [F,ia,ib]=intersect(most_mob(:,1),E);
    most_mob=most_mob(ia,:); % contains coordinates of most mobile particles in cluster size of more than or equal to 4
    dist=pdist2(most_mob(:,1:2),most_mob(:,1:2),'euclidean','Smallest',20); 
    f=(dist>0 & dist<=sigma);
    count=sum(f);
    G=histc(count,y); G=G';
    nn_count=nn_count+G;
end
total=sum(nn_count);
nn_count=nn_count/total;