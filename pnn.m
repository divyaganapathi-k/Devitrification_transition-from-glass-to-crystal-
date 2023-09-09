% %to plot the most mobile particles and cluster them
% Dynamic heterogeneity
% clearvars -except R %tracking done using positions
% t=25; %this is the deltat value where the nongaussian parameter has the peak
% H=circshift(R,-t);
% %to plot the histogram
% A=H-R;
% % n=1;
% G=[];
% X=find (A(:,4)==0 & A(:,3)==t);
% G(:,1)=((A(X,1)).^2+(A(X,2)).^2).^0.5;
% G(:,2:5)=R(X,1:4);
% %selecting 10% of the particles and defining them as most mobile particles
% b=max(G(:,1));
% % hist(G(:,1),50);
% %choosing the cut off
% c=floor(0.1*length(G(:,1)));
% [E,IX]=sort(G(:,1),'descend');
% F=[]; mostmobile=[];
% F=IX(1:c);
% % D contains the most mobile particles
% mostmobile(:,1:5)=G(F,1:5);  
% n=max(R(:,3));
% sigma=45.2;
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