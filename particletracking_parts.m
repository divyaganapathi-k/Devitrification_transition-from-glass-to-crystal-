% %particle coordinates
clearvars
err=0;
% for j=1:1:10
    coor=[];
% (1+(j-1)*1000):1:(j*1000)
for i=6:1:10
%     A=imread(strcat('E:\Devitrification\Bandpass_data\phi3\Crystal_Set10_cropped\',num2str(i,'%04d'),'.tif'));
%     A=imread(strcat('E:\Devitrification\Bandpass_data\Set1\',num2str(k ,'%04d'),'.tif'));
    A=imread(strcat('C:\Users\Divya\Desktop\Test\Bandpass\psi4\',num2str(i),'.tif'));
    try
%         A=imread(strcat('E:\Devitrification\Experiment-2\Bandpass_data\Series10\Project2-phi3-31.5deg-set2.lif_Series010_t',num2str(i-1,'%04d'),'.tif'));
    catch
        err=1;
       break
    end
    B=bpass(A,2,7);
%     AA=im2double(A);
%     image(B);
    figure
    imshow(A);
%     image(B);
    C=feature2D(B,3,9,200,3,2);
    C(:,6)=i;
    hold on
    scatter(C(:,1),C(:,2),11,'r','filled');
%     hold off
    coor=vertcat(coor,C); 
end
%     save((strcat('E:\Devitrification\Experiment-2\Coordinates\Series10\Set',num2str(j),'.mat')), 'coor');
%     if err==1
%         break
%     end    
% end
% % 
% % % pixel biassing
% hist(mod(coor(:,2),1),20);

%tracking
% R=trackmem(coor(:,[1 2 6]),10,2,10,0);
% % R=trackmem(coor,13,2,10,0);
% 
% % pretracking of the particles fitting gaussian for displacements between two successive images
% R1=circshift(R,-1);
% R2=R-R1;
% f=find(R2(:,3)==-1 & R2(:,4)==0);
% A=R2(f,1:2);
% edges=-12:0.1:12;
% count=histc(A(:,1),edges);
% count1=histc(A(:,2),edges);
% gfitdata=horzcat(edges',count);
% gfitdata1=horzcat(edges',count1);
% save('E:\Devitrification\Coordinates\phi3_Set10_cropped_7.mat','R','coor');
% H=drift_loop(R,60);