for i=1:1:max(H(:,3))
    f=(H(:,3)==i);
    scatter(H(f,1),H(f,2),200,'g','filled');
    hold on
    axis equal
    axis off
    axis([320 640 320 640])
    hold off
    saveas(gcf,strcat('F:\trial_dedrift\',num2str(i),'.tif'));
end