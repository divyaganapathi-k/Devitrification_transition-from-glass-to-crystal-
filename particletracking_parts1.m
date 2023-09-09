% %particle coordinates
% clearvars
% err=0;
% for j=1:1:4
%     coor=[];
%     for i=(1+(j-1)*1000):1:(j*1000)
%         try
%             A=imread(strcat('E:\Devitrification\Experiment-1\Bandpass_data\Series003\Project-phi3-divya.lif_Series003_t',num2str(i-1,'%04d'),'.tif'));
%         catch
%             err=1;
%            break
%         end
%         B=bpass(A,2,9);
% %         imshow(A);
%         C=feature2D(B,4,13,220,2,2);
%         C(:,6)=i;
% %         hold on
% %         scatter(C(:,1),C(:,2),11,'r','filled');
% %         hold off
%         coor=vertcat(coor,C); 
%     end
%     hist(mod(coor(:,2),1),20);
%     saveas(gcf,strcat('E:\Devitrification\Experiment-1\Coordinates\Series003\Set',num2str(j),'.tif'));
%     save((strcat('E:\Devitrification\Experiment-1\Coordinates\Series003\Set',num2str(j),'.mat')), 'coor');
%     if err==1
%         break
%     end    
% end
% 
%particle coordinates
% clearvars
% err=0;
% for j=1:1:4
%     coor=[];
%     for i=(1+(j-1)*1000):1:(j*1000)
%         try
%             A=imread(strcat('E:\Devitrification\Experiment-1\Bandpass_data\Series008\Project-phi3-divya.lif_Series008_t',num2str(i,'%03d'),'.tif'));
%         catch
%             err=1;
%            break
%         end
%         B=bpass(A,2,9);
%         imshow(A);
%         C=feature2D(B,4,13,220,2,2);
%         C(:,6)=i;
%         hold on
%         scatter(C(:,1),C(:,2),11,'r','filled');
%         hold off
%         coor=vertcat(coor,C); 
%     end
%     hist(mod(coor(:,2),1),20);
%     saveas(gcf,strcat('E:\Devitrification\Experiment-1\Coordinates\Series008\Set',num2str(j),'.tif'));
%     save((strcat('E:\Devitrification\Experiment-1\Coordinates\Series008\Set',num2str(j),'.mat')), 'coor');
%     if err==1
%         break
%     end    
% end
% 
% particle coordinates
% clearvars
% err=0;
% for j=1:1:4
%     coor=[];
%     for i=(1+(j-1)*1000):1:(j*1000)
%         try
%             A=imread(strcat('E:\Devitrification\Experiment-1\Bandpass_data\Series018\Project-phi3-divya.lif_Series018_t',num2str(i,'%03d'),'.tif'));
%         catch
%             err=1;
%            break
%         end
%         B=bpass(A,2,9);
% %         imshow(A);
%         C=feature2D(B,4,13,220,2,2);
%         C(:,6)=i;
% %         hold on
% %         scatter(C(:,1),C(:,2),11,'r','filled');
%     %     hold off
%         coor=vertcat(coor,C); 
%     end
%     hist(mod(coor(:,2),1),20);
%     saveas(gcf,strcat('E:\Devitrification\Experiment-1\Coordinates\Series018\Set',num2str(j),'.tif'));
%     save((strcat('E:\Devitrification\Experiment-1\Coordinates\Series018\Set',num2str(j),'.mat')), 'coor');
%     if err==1
%         break
%     end    
% end

% particle coordinates
% clearvars
% err=0;
% for j=4:1:4
%     coor=[];
%     for i=(1+(j-1)*1000):1:(j*1000)
%         try
%             A=imread(strcat('E:\Devitrification\Experiment-1\Bandpass_data\Series019\Project-phi3-divya.lif_Series019_t',num2str(i,'%04d'),'.tif'));
%         catch
%             err=1;
%            break
%         end
%         B=bpass(A,2,9);
% %         imshow(A);
%         C=feature2D(B,4,13,220,2,2);
%         C(:,6)=i;
% %         hold on
% %         scatter(C(:,1),C(:,2),11,'r','filled');
% %         hold off
%         coor=vertcat(coor,C); 
%     end
%     if isempty(coor==1)
%         break
%     end
%     hist(mod(coor(:,2),1),20);
%     saveas(gcf,strcat('E:\Devitrification\Experiment-1\Coordinates\Series019\Set',num2str(j),'.tif'));
%     save((strcat('E:\Devitrification\Experiment-1\Coordinates\Series019\Set',num2str(j),'.mat')), 'coor');
%     if err==1
%         break
%     end
% end


% particle coordinates
clearvars
err=0;
for j=1:1:4
    coor=[];
    for i=(1+(j-1)*1000):1:(j*1000)
        try
            A=imread(strcat('E:\Devitrification\Experiment-1\Bandpass_data\Series020\Project-phi3-divya.lif_Series020_t',num2str(i,'%04d'),'.tif'));
        catch
            err=1;
           break
        end
        B=bpass(A,2,9);
%         imshow(A);
        C=feature2D(B,4,13,220,2,2);
        C(:,6)=i;
%         hold on
%         scatter(C(:,1),C(:,2),11,'r','filled');
%         hold off
        coor=vertcat(coor,C); 
    end
    if isempty(coor==1)
        break
    end
    hist(mod(coor(:,2),1),20);
    saveas(gcf,strcat('E:\Devitrification\Experiment-1\Coordinates\Series020\Set',num2str(j),'.tif'));
    save((strcat('E:\Devitrification\Experiment-1\Coordinates\Series020\Set',num2str(j),'.mat')), 'coor');
    if err==1
        break
    end    
end
