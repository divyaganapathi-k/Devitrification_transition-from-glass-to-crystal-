% volume and edges per particle
% pos_lst=voronoi_all;
% clearvars -except pos_lst
sigma=33.2;
% n=max(pos_lst(:,5));
for j=1:50:2000
    f=voro(:,3)==j;
    A=voro(f,1:2);
%     f=(pos_lst(:,3)==j);
%     A=pos_lst(f,1:2);
%     C=imread(strcat('H:\Bandpass_crystal_1\',num2str(j-1),'.tif'));
%     imshow(C);
%     hold on
    %%%%%%% does not make any difference
%     voronoi(A(:,1),A(:,2));
%     TRI=delaunay(A(:,1),A(:,2));
%     [vx,vy]=voronoi(A(:,1),A(:,2),TRI);
    %%%%%%%
     
    %%%%%%%voronoi 2-D batch, same answer as voronoin
%     [vx,vy]=voronoi(A(:,1),A(:,2));
%     scatter(A(:,1),A(:,2),2,'r','o');
%     plot(vx,vy,'g-','LineWidth',0.5);
%     xlim([min(A(:,1)) max(A(:,1))])
%     ylim([min(A(:,2)) max(A(:,2))])
%     hold off
% %     E=polyarea(vx,vy); %is not the correct thing to apply
%     %%%%%%% 
%     
%     %to plot using voronoin
    [v,c] = voronoin(A); 
    xlim([min(A(:,1)) max(A(:,1))])
    ylim([min(A(:,2)) max(A(:,2))])
    hold on
%     
%     % to calculate the area for the required particle
% %     [v,c] = voronoin(A); 
%     for i = 1:length(c) 
% %     if all(c{i}~=1)   % If at least one of the indices is 1, 
% %                       % then it is an open region and we can't 
% %                       % patch that.
%      A(i,3)= polyarea(v(c{i},1),v(c{i},2)); % use color i.
% %     end
%     end
%     A(:,4)=A(:,3)/100;
    for i = 1:length(c) 
         if all(c{i}~=1)
%         plot(v(c{i},1),v(c{i},2));
%         scatter(A(i,1),A(i,2),2,'r','filled');
            patch(v(c{i},1),v(c{i},2),length(c{i}));
            caxis([3 9])
            colormap(jet);
%             plotc(v(c{i},1),v(c{i},2),'Color','g','LineStyle','-','Linewidth',2);
         end
    end
    hold on
    axis([200 3900 200 3900]);
%     axis equal
    f1=hard_particles_all(:,3)==j;
    scatter(hard_particles_all(f1,1),hard_particles_all(f1,2),2,'k','filled');
    f1=soft_particles_all(:,3)==j;
    scatter(soft_particles_all(f1,1),soft_particles_all(f1,2),2,'w','filled');
    print(strcat('E:\voronoi_soft_hard\',num2str(j)),'-dtiff','-r300');  
end