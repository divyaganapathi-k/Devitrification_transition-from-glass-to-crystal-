% clearvars -except soft_particles_all soft_particles_all mrco_all
n=250;
sigma=1.4*18.4;
y=1:1:10;
clust_count=zeros(100,1);
nn_count_soft=zeros(10,1);
number_soft=0;
soft=[];
for i=1:1:300
    for j=1:1:12
        f=(soft_particles_all(:,3)==i & soft_particles_all(:,4)==j);
        soft_particles=soft_particles_all(f,:);
        L=linkage(soft_particles(:,1:2)); % Links the particles
        C=cluster(L,'cutoff',sigma,'criterion','distance'); 
        soft_particles=horzcat(soft_particles,C);
        num=max(C);
        x=1:1:num;
        A=histc(C,x);
        f=(A(:,1)>8 & A(:,1)<13);
        B=nonzeros(f.*x'); %cluster numbers in which the size in the required range
        D=ismember(C,B);
        number_soft=number_soft+length(B);
        E=D.*soft_particles(:,1);
        [F,ia,ib]=intersect(soft_particles(:,1),E);
        soft_particles=soft_particles(ia,:); % contains coordinates of most mobile particles in cluster size of required range
    %     soft_particles(:,4)=i;
        dist=pdist2(soft_particles(:,1:2),soft_particles(:,1:2),'euclidean','Smallest',10); 
        f=(dist>0 & dist<=sigma);
        count=sum(f);
        G=histc(count,y); G=G';
        nn_count_soft=nn_count_soft+G;
        soft=vertcat(soft,soft_particles);
    end
end
total=sum(nn_count_soft);
nn_count_soft=nn_count_soft/total;
% 
clust_count=zeros(100,1);
nn_count_hard=zeros(10,1);
number_hard=0;
hard=[];
for i=1:1:300
    for j=1:1:12
        f=(hard_particles_all(:,3)==i & hard_particles_all(:,4)==j);
        hard_particles=hard_particles_all(f,:);
        L=linkage(hard_particles(:,1:2)); % Links the particles
        C=cluster(L,'cutoff',sigma,'criterion','distance'); 
        hard_particles=horzcat(hard_particles,C);
        num=max(C);
        x=1:1:num;
        A=histc(C,x);
        f=(A(:,1)>8 & A(:,1)<13);
        B=nonzeros(f.*x'); %cluster numbers in which the size in the required range
        D=ismember(C,B);
        number_hard=number_hard+length(B);
        E=D.*hard_particles(:,1);
        [F,ia,ib]=intersect(hard_particles(:,1),E);
        hard_particles=hard_particles(ia,:); % contains coordinates of most mobile particles in cluster size of required range
        hard_particles(:,4)=i;
        dist=pdist2(hard_particles(:,1:2),hard_particles(:,1:2),'euclidean','Smallest',10); 
        f=(dist>0 & dist<=sigma);
        count=sum(f);
        G=histc(count,y); G=G';
        nn_count_hard=nn_count_hard+G;
        hard=vertcat(hard,hard_particles);
    end
end
total=sum(nn_count_hard);
nn_count_hard=nn_count_hard/total;
%  cmp=getPyPlot_cMap('magma', [], [], '"C:\Users\Divya\AppData\Local\Programs\Python\Python37\python.exe"');