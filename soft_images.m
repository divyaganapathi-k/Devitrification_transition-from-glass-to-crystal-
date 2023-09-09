a1=unique(soft3(:,3));
for i=1:1:length(a1)
    f=soft3(:,3)==a1(i);
    scatter(soft3(f,6),soft3(f,7),100,soft3(f,3),'filled');
    axis equal
    axis([700 1800 3300 4200])
    colormap(jet)
    caxis([0 12235])
    saveas(gcf,strcat('H:\Devitrification\Images\soft\2\',num2str(a1(i)),'.tif'));
end