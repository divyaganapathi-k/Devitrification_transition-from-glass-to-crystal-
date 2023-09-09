pos_lst=[];
i=1;
for k=1:1:1200
    A=imread(strcat('E:\Devitrification\Experiment-1\Bandpass_data\Series008\Project-phi3-divya.lif_Series008_t',num2str(k,'%03d'),'.tif'));
%     A=imread(strcat('E:\Devitrification\Bandpass_data\phi3\Crystal_Set10_cropped\',num2str(k,'%04d'),'.tif'));
%     imshow(A);
%     hold on
    [C,R]=imfindcircles(A,[2 25]);
%     scatter(C(:,1),C(:,2),5,'b','filled');
%     hold off
    C(:,3)=i;
    pos_lst=vertcat(pos_lst,C);
    i=i+1;
end
