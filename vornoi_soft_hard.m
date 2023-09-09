% to calculate area of voronoi cells
data=pos_lst;
voronoi_all=[];
max(data(:,3))
for i=1:1:2000
    f=data(:,3)==i;
    A=data(f,:); 
    [v,c]=voronoin(A(:,1:2));
    B=zeros(length(c),1);
    for j=1:1:length(c)
        B(j,1)=polyarea(v(c{j},1),v(c{j},2));
    end
     C=cellfun('length',c);
    A=horzcat(A,B,C);
    voronoi_all=vertcat(voronoi_all,A); 
end
[C,ia,ib]=intersect(soft_particles_all(:,1:3),voronoi_all(:,[1 2 4]),'rows');
soft1=voronoi_all(ib,:);
f=isnan(soft1(:,5))==0;
soft2=soft1(f,6);
H=histc(soft2,1:1:20);
sum(H)

%to associate with soft particles
% for i=1:1:max(req_coor(:,3))
%     A=imread(strcat('D:\Sample5_2D_data\Sample5_xyplane_dedrift_imagej\',num2str(i-1,'%05d'),'.tif'));
%     imshow(A);
%     hold on
%     ff=req_coor(:,3)==i;
%     voronoi(req_coor(ff,2),req_coor(ff,1));
%     f=soft_particles_all(:,3)==i;
%     scatter(soft_particles_all(f,2),soft_particles_all(f,1),50,'r');
%     hold off
% end
% req_coor=[];
% for i=1:1:2000
%     f1=soft(:,3)==i;
%     f2=voronoi_all(:,4)==i;
%     [A,I]=pdist2(voronoi_all(f2,1:2),soft(f1,1:2),'euclidean','Smallest',1);
%     f=A<=4;
%     I=I.*f;
%     I=nonzeros(I);
%     coor=voronoi_all(I,:);
%     req_coor=vertcat(req_coor,coor);
% end