sigma=38;
zoom off
for i=1:1:12235
    f=pos_lst(:,3)==i;
%     set( hAxes, 'XLimMode', 'manual' )
    scatter(pos_lst(f,1),pos_lst(f,2),0.1*sigma,'k','filled');
    set(gcf,'WindowStyle','docked')
    axis equal
    axis([-1500 5500 0 4096])
    set(gca,'Tickdir','out');
%     H=getframe(gca);
    print(strcat('H:\Sample5_dedrifted_bw5\',num2str(i)),'-dtiff','-r1000');
%     imwrite(H.cdata,strcat('H:\Sample5_dedrifted_bw3\',num2str(i),'.png'));
    close all
end
% 
% for i=1:1:2000
%     f=pos_lst(:,3)==i;
%     scatter(pos_lst(f,1),pos_lst(f,2),0.15*sigma,'k','filled');
%     axis([0 4096 0 4096])
%     axis equal
%     set(gca,'Tickdir','out');
%     H=getframe(gca);
%     imwrite(H.cdata,strcat('H:\Sample5_dedrifted_bw2\',num2str(i),'.png'));
% %     close all
% end

% %worst do not choose viscircles
% for i=1:1:2000
%     f=pos_lst(:,3)==i;
%     A=ones(length(pos_lst(f,1)),1)*0.1*sigma;
%     viscircles(pos_lst(f,1:2),A);
%     axis([0 4096 0 4096])
%     axis equal
%     set(gca,'Tickdir','out');
%     H=getframe(gca);
%     print(strcat('H:\Sample5_dedrifted_bw3\test',num2str(i)),'-dtiff','-r600');
% %     imwrite(H.cdata,strcat('H:\Sample5_dedrifted_bw3\',num2str(i),'.png'));
%     close all
% end