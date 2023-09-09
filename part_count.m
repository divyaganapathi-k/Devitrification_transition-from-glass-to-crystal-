noofparticles=[];
% f=find(coor(:,1)>=158 & coor(:,1)<=316 & coor(:,2)>=158 & coor(:,2)<=474);
% coor1=coor(f,:);
for i=1:1: max(coor(:,6))
    f=find(coor(:,6)==i);
    noofparticles(i,1)=i;
    noofparticles(i,2)=length(f);
end
% radofgyr=[];
% for i=1:1:5000
%     f=find(coor(:,6)==i);
%     A=coor(f,3);
%     radofgyr(i,1)=i;
%     radofgyr(i,2)=mean(A);
% end