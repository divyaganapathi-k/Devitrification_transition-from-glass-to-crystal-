clearvars -except x_t
n=12235;
deltat=1000;
sigma=38;     %diameter of the large particle, first peak of radial distribution function
phop_all=zeros(12235,2);
j=1;
for i=(1+(deltat/2)):1:(n-(deltat/2))
    %calculating hop for each particle at ith frame
    %period of A
    f=(x_t(:,1)>=(i-(deltat/2)) & x_t(:,1)<=i);
    x_t1=x_t(f,:);
    %period of B
    f=(x_t(:,1)>=i & x_t(:,1)<=(i+(deltat/2)));
    x_t2=x_t(f,:);
    ria_mean=mean(x_t1(:,2));
    rib_mean=mean(x_t2(:,2));
    x_t1(:,3)=x_t1(:,2)-rib_mean;
    x_t1(:,4)=(x_t1(:,3)).^2;
    x_t2(:,3)=x_t2(:,2)-ria_mean;
    x_t2(:,4)=(x_t2(:,3)).^2;
    hop1=mean(x_t1(:,4));
    hop2=mean(x_t2(:,4));
    phop=(hop1.*hop2).^(0.5);
    phop_all(j,1)=i;
    phop_all(j,2)=phop;
    j=j+1;
end
phop_all=phop_all(1:j-1,:);
