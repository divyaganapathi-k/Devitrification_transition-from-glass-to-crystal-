% clearvars -except R
% % R=R(:,[1 2 6 7]);
% H=drift_loop(R(:,[1 2 6 7]),20);
% n=max(H1(:,3));
% % close all
% for i=1:1:n
%     f=find(H1(:,3)==i);
%     scatter(H1(f,1),H1(f,2),75,'b','filled');
%     axis equal
%     axis off
%     axis([3072 4096 0 1024])
%     h=gcf;
% %     saveas(h,strcat('E:\Devitrification\Experiment-1\psi6_images\Avalanche\Images\',num2str(i),'.tif'));
%     set(gcf,'WindowStyle','docked')
%     fig = gcf;
%     fig.PaperPositionMode = 'auto';
%     print(strcat('E:\Devitrification\Experiment-1\psi6_images\Avalanche\Images3\',num2str(i)),'-dtiff');
% end
n=12235;
for i=1:300:n-300
    B=zeros(1470,1470);
    B=double(B);
    for j=i:1:i+300
        A=imread(strcat('E:\Sample5_scatter1\',num2str(j),'.tif'));
        A=rgb2gray(A);
        A=im2double(A);
        B=B+A;
    end
    B=B/300;
    B=1.1-B;
    imshow(B);
    hold on
    f=soft(:,3)>=i & soft(:,3)<=i+300;
    scatter(soft(f,5)*(1470/4300),soft(f,6)*(1470/4300),2,'w','filled');
    axis equal
    axis off
    colormap(jet)
    h=gcf;
    set(gcf,'WindowStyle','docked')
    fig = gcf;
    hold off
%     fig.PaperPositionMode = 'auto';
    print(strcat('E:\Average_images_300\',num2str(i)),'-dtiff','-r1000');
    close all
%     saveas(h,strcat('E:\Devitrification\Experiment-1\psi6_images\Avalanche\Average_Images',num2str(i),'.tif'));
end