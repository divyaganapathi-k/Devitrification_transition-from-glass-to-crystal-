% mrco_all=[];
% hard_particles_all=[];
% soft_particles_all=[];
% for i=1:1:300
%     f=req_coor(:,4)==i;
%     C=req_coor(f,:);
%     D=sortrows(C,-5);
%     E=sortrows(C,5);
%     soft_particles=D(1:2900,:);
%     hard_particles=E(1:2900,:);
% %     mrco_all=vertcat(mrco_all,mrco);
%     hard_particles_all=vertcat(hard_particles_all,hard_particles);
%     soft_particles_all=vertcat(soft_particles_all,soft_particles);
% %     scatter(mrco(:,2),mrco(:,1),6,'g','filled');
% %     scatter(hard_particles(:,2),hard_particles(:,1),10,'r');
% %     scatter(hard_particles(:,2),hard_particles(:,1),10,'b');
% %     hold off
% %     print(strcat('E:\Devitrification\Sample_5_data\Sampe5_mrc0_hard_hard\',num2str(i-1)),'-dtiff','-r300');
% end

% n=250;
sigma=18*1.4;
y=1:1:200;
% clust_count_soft=zeros(100,1);
nn_count_soft=zeros(200,1);
number_soft=0;
soft=[];
for i=1:1:300
    f=(soft_particles_all(:,4)==i);
    soft_particles=soft_particles_all(f,1:3);
    L=linkage(soft_particles); % Links the particles
    C=cluster(L,'cutoff',sigma,'criterion','distance'); 
    soft_particles=horzcat(soft_particles,C); 
    num=max(C);
    x=1:1:num;
    A=histc(C,x);
    f=(A(:,1)>16);
    B=nonzeros(f.*x'); %cluster numbers in which the size in the required range
    D=ismember(C,B);
    number_soft=number_soft+length(B);
    E=D.*soft_particles(:,1);
    [F,ia,ib]=intersect(soft_particles(:,1),E);
    soft_particles=soft_particles(ia,:); % contains coordinates of most mobile particles in cluster size of required range
    dist=pdist2(soft_particles(:,1:3),soft_particles(:,1:3),'euclidean','Smallest',25); 
    f=(dist>0 & dist<=sigma);
    count=sum(f);
    G=histc(count,y); G=G';
    nn_count_soft=nn_count_soft+G;
    soft=vertcat(soft,soft_particles);
end
total=sum(nn_count_soft);
nn_count_soft=nn_count_soft/total;

n=250;
sigma=18*1.4;
y=1:1:200;
% clust_count_soft=zeros(100,1);
nn_count_hard=zeros(200,1);
number_hard=0;
hard=[];
for i=1:1:300
    f=(hard_particles_all(:,4)==i);
    hard_particles=hard_particles_all(f,1:3);
    L=linkage(hard_particles); % Links the particles
    C=cluster(L,'cutoff',sigma,'criterion','distance'); 
    hard_particles=horzcat(hard_particles,C); 
    num=max(C);
    x=1:1:num;
    A=histc(C,x);
    f=(A(:,1)>16);
    B=nonzeros(f.*x'); %cluster numbers in which the size in the required range
    D=ismember(C,B);
    number_hard=number_hard+length(B);
    E=D.*hard_particles(:,1);
    [F,ia,ib]=intersect(hard_particles(:,1),E);
    hard_particles=hard_particles(ia,:); % contains coordinates of most mobile particles in cluster size of required range
    dist=pdist2(hard_particles(:,1:3),hard_particles(:,1:3),'euclidean','Smallest',25); 
    f=(dist>0 & dist<=sigma);
    count=sum(f);
    G=histc(count,y); G=G';
    nn_count_hard=nn_count_hard+G;
    hard=vertcat(hard,hard_particles);
end
total=sum(nn_count_hard);
nn_count_hard=nn_count_hard/total;