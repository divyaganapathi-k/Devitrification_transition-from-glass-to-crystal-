n=250;
sigma=37.8;
distance=1.4*sigma;
distances_all_hard=[];
parfor i=1:1:n
    f=hard_particles_all(:,3)==i;
    A=hard_particles_all(f,:);
    f=mrco_all(:,3)==i;
    B=mrco_all(f,:);
    C=pdist2(B(:,1:2),A(:,1:2),'euclidean','Smallest',1);
%     C=mean(C);
    distances_all_hard=vertcat(distances_all_hard,C');
end
distances_all_hard=distances_all_hard/distance;
x=min(distances_all_hard):0.5:max(distances_all_hard);
hist_distances_hard=histc(distances_all_hard,x);

n=250;
sigma=37.4;
distance=1.4*sigma;
distances_all_soft=[];
parfor i=1:1:n
    f=soft_particles_all(:,3)==i;
    A=soft_particles_all(f,:);
    f=mrco_all(:,3)==i;
    B=mrco_all(f,:);
    C=pdist2(B(:,1:2),A(:,1:2),'euclidean','Smallest',1);
%     C=mean(C);
    distances_all_soft=vertcat(distances_all_soft,C');
end
distances_all_soft=distances_all_soft/distance;
x=min(distances_all_soft):0.5:max(distances_all_soft);
hist_distances_soft=histc(distances_all_soft,x);

