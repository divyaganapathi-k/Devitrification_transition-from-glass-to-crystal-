% for k=40:1:65
%     AA=imread(strcat('C:\Users\Divya\Desktop\Test\Experiment-5\Bandpass_data\',num2str((k*10)+6),'.tif'));
%     imshow(AA);
%     hold on
%     f=find(pos_lst(:,5)==k);
%     scatter(pos_lst(f,1),pos_lst(f,2),10,'b','filled');
%     hold off
% %     set(gcf,'WindowStyle','docked')
% %     fig = gcf;
% %     fig.PaperPositionMode = 'auto';
% %     print(strcat('C:\Users\Divya\Desktop\Test\Experiment-5\scatter\',num2str(k)),'-dtiff','-r1000');
% end
% pos_lst=coor;
% no_of_par=[];
% for i=1:1:124
%      f=(pos_lst(:,5)==i);
%      no_of_par(i,1)=sum(f);
% end
% for i=1:1:2000
%     f=(H(:,3)==i);
%     scatter(H(f,1),H(f,2),150,'b','filled');
%     axis([1536 2048 1536 2048])
%     axis equal
%     axis off
%     set(gcf,'WindowStyle','docked')
%     print(strcat('D:\scatter_plot_crystal1\',num2str(i)),'-dtiff');
% end

for i=1:1:200
    A=imread(strcat('E:\Crystal2_dedrifted\',num2str(i-1,'%04d'),'.tif'));
    imshow(A);
    hold on
    f=H(:,5)==i;
    scatter(H(f,1),H(f,2),20,H(f,6),'filled');
    hold off
    saveas(gcf,strcat('E:\scatter_test\',num2str(i-1,'%04d'),'.tif'));
end