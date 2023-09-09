for i=1:1:1
    for j=3:1:210
        movefile(strcat('F:\Sample5_double\Sample5_exp2_zstack_Series006_t',num2str(i,'%03d'),'_z',num2str(j-1,'%03d'),'.tif'),strcat('F:\Sample5_double\Sample5_exp2_zstack_Series003_t',num2str(i+966,'%03d'),'_z',num2str(j-1,'%03d'),'.tif'));
    end
end
% i=967;
% % for i=1:1:1
%     for j=1:1:210
%         movefile(strcat('F:\Sample5_double\Sample5_exp2_zstack_Series003_t',num2str(i,'%03d'),'_z',num2str(j-1,'%03d'),'.tif'),strcat('F:\Sample5_double\Sample5_exp2_zstack_Series003_t',num2str(i-1,'%03d'),'_z',num2str(j-1,'%03d'),'.tif'));
%     end
% % end