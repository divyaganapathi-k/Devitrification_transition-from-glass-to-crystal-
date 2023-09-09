for i=1:10:2000
    f=(soft(:,3)>=i & soft(:,3)<(i+10));
    scatter(soft(f,1),soft(f,2),15,soft(f,4));
    hold on
    axis equal
    axis off
    f=(psi6(:,3)>=i & psi6(:,3)<(i+10));
    scatter(psi6(f,1),psi6(f,2),15,'g','filled');
    set(gcf,'WindowStyle','docked')
    hold off
    print(strcat('E:\Devitrification\Sample5\Sample_5_data\soft_crystalline\',num2str(i-1)),'-dtiff','-r300');
end