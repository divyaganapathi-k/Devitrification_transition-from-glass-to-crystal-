% clearvars -except R
% R=R(:,[1 2 6 7]);
% H=drift_loop(R(:,[1 2 6 7]),20);
% n=max(H(:,3));
% % % close all
% n=max(H(:,4));
% ((0.03)*(H(f,4)).^(0.5))
% for i=1:1:7741
%     f=(H(:,3)==i);
%     s=scatter(H(f,1),H(f,2),6,'b','filled');
%     axis equal
%     box on
%     axis off
%     axis([-100 4200 -100 4200])
%     set(gca,'TickDir','out');
% %     h=gcf;
% %     saveas(h,strcat('E:\Devitrification\Experiment-1\psi6_images\Avalanche\Images\',num2str(i),'.tif'));
%     set(gcf,'WindowStyle','docked')
%     fig = gcf;
%     fig.PaperPositionMode = 'auto';
%     print(strcat('E:\Crystal2_scatter_all\',num2str(i)),'-dtiff','-r300'); 
% end_
% n=7740;
for i=1:25:7741
    B=zeros(1557,1557);
    B=double(B);
    for j=i:1:i+999
        A=imread(strcat('E:\Crystal2_scatter_all1\',num2str(j),'.tif'));
        A=rgb2gray(A);
        A=im2double(A);
        B=B+A;
    end
    B=B/500;
    B=1.1-B;
    B=B*100;
    C=image(B);
    caxis([0 1])
    colormap(jet)
    axis equal
    axis off
    h=gcf;
    set(gcf,'WindowStyle','docked')
    set(gcf, 'Color', 'None')
    fig = gcf;
%     hold on
%     scatter(soft(:,6),soft(:,7),5,'w','filled');
    %     fig.PaperPositionMode = 'auto';
    %     fig_pos = fig.PaperPosition;
    %     fig.PaperSize = [fig_pos(3) fig_pos(4)];
    %     imwrite(B,strcat('E:\Devitrification\Experiment-1\psi6_images\Avalanche\Average_Images4\',num2str(i),'.tif'));
    %     export_fig(strcat('E:\Devitrification\Experiment-1\psi6_images\Avalanche\Average_Images4\',num2str(i)),'-tif');
%     print(strcat('E:\Sample5_Final_Analysis\Images\Sample5_2DAverage_images_300',num2str(i)),'-dtiff','-r1000');
    print(strcat('E:\Crystal2_average5\',num2str(i)),'-dtiff','-r500');
    close all
    %    print(strcat('D:\Devitrification\',num2str(i)),'-dtiff','-r1000');
    % %     saveas(h,strcat('E:\Devitrification\Experiment-1\psi6_images\Avalanche\Average_Images',num2str(i),'.tif'));
end

% H1=sortrows(H1,[3 4]);
% R=R(:,[1 2 5 6]);
% H=sortrows(H,[3 4]);
% R=sortrows(R,[3 4]);
% A=R(:,1:2)-H(:,1:2);
% A(:,3:4)=R(:,3:4);
% [A1,ia,ib]=unique(A(:,3));
% B1=A(ia,:); %dedrift_100
% A=H(:,1:2)-H1(:,1:2);
% A(:,3:4)=H(:,3:4);
% [A1,ia,ib]=unique(A(:,3));
% B2=A(ia,:); %dedrift_10
% data=soft;
% clear R H
% pos_lst=pos_lst(:,[1 2 5]);
% dedrift_coordinates=[];
% for i=1:1:max(pos_lst(:,3))
%     f1=(pos_lst(:,3)==i);
%     A=pos_lst(f1,:);
%     f2=B1(:,3)==i;
%     B=B1(f2,:);
%     A(:,1)=A(:,1)-B(1,1);
%     A(:,2)=A(:,2)-B(1,2);
%     dedrift_coordinates=vertcat(dedrift_coordinates,A);
% end
% dedrift_coordinates=horzcat(dedrift_coordinates,pos_lst(:,1:3));

% dedrift_coordinates=[];
% parfor i=1:1:max(pos_lst(:,3))
%     f1=(pos_lst(:,3)==i);
%     A=pos_lst(f1,:);
%     f2=D(:,3)==i;
%     B=D(f2,:);
%     A(:,1)=A(:,1)-B(1,1);
%     A(:,2)=A(:,2)-B(1,2);
%     dedrift_coordinates=vertcat(dedrift_coordinates,A);
% end

% for i=1:1000:12235
%     A=imread(strcat('E:\Average_images_2000_crop\',num2str(i),'.tif'));
%     imshow(A);
%     hold on
%     f=soft(:,3)>i & soft(:,3)<i+2000;
%     scatter(soft(f,1),soft(f,2),0.25,'w','filled');
%     hold off
%     axis equal
%     axis off
%     h=gcf;
%     set(gcf,'WindowStyle','docked')
%     set(gcf, 'Color', 'None')
%     fig = gcf;
%     print(strcat('E:\Averageandsoft\',num2str(i)),'-dtiff','-r1000');
%     close all
% end
% % for j=1:1:3
%     if j==1
%        a1=121; a2=497; b1=3257; b2=3773;
%     elseif j==2
%         a1=964; a2=1622; b1=3507; b2=4201;
%     elseif j==3
%         a1=2025; a2=2375; b1=3468; b2=3955;
%     end
%     for i=1:100:12126
%         A=imread(strcat('E:\Average_images_100_crop\',num2str(i),'.tif'));
%         A1=A(b1:b2,a1:a2,:);
%         imshow(A1);
%         axis equal
%         axis off
%         h=gcf;
%         set(gcf,'WindowStyle','docked')
%         set(gcf, 'Color', 'None')
%         fig = gcf;
%         print(strcat('E:\crystallites\Region',num2str(j),'\',num2str(i)),'-dtiff','-r300');
%         close all
%     end
% end