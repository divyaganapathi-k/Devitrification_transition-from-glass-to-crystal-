% for i=1:1:1
%     for j=1:1:210
%         movefile(strcat('F:\Sample5_double\Sample5_exp2_zstack_Series006_t',num2str(i-1,'%03d'),'_z',num2str(j-1,'%03d'),'.tif'),strcat('F:\Sample5_double\Sample5_exp2_zstack_Series003_t',num2str(i+965,'%03d'),'_z',num2str(j-1,'%03d'),'.tif'));
%     end
% end
% i=967;
% % for i=1:1:1
%     for j=1:1:210
%         movefile(strcat('F:\Sample5_double\Sample5_exp2_zstack_Series003_t',num2str(i,'%03d'),'_z',num2str(j-1,'%03d'),'.tif'),strcat('F:\Sample5_double\Sample5_exp2_zstack_Series003_t',num2str(i-1,'%03d'),'_z',num2str(j-1,'%03d'),'.tif'));
%     end
% % end
% for i=1:1:1380
%     for j=1:1:210
%         movefile(strcat('F:\Sample5_double\Sample5_exp2_zstack_Series003_t',num2str(i-1,'%03d'),'_z',num2str(j-1,'%03d'),'.tif'),strcat('F:\Sample5_double\Sample5_exp2_zstack_Series003_t',num2str(i-1,'%04d'),'_z',num2str(j-1,'%03d'),'.tif'));
%     end
% end

% for i=1:1:2742
%     movefile(strcat('G:\Crystal2_set2\Crystal2.lif_Series027_t',num2str(i-1,'%04d'),'.tif'),strcat('G:\Crystal2_set2\Crystal2.lif_Series026_t',num2str(i+4999,'%04d'),'.tif'));
% end

for i=1:1:120
    movefile(strcat('E:\Sample5_Final_Analysis\Images\Sample5_2D_Average_images_300\a',num2str(i),'.tif'),strcat('E:\Sample5_Final_Analysis\Images\Sample5_2D_Average_images_300\',num2str(((i-1)*100)+1),'.tif'));
end