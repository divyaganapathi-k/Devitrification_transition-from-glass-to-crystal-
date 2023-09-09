for k=4061:10:5171
%     figure
    AA=imread(strcat('E:\Devitrification\Experiment-1\Bandpass_data\Series020\Project-phi3-divya.lif_Series020_t',num2str(k-4055,'%04d'),'.tif'));
    imshow(AA);
    hold on
    f=find(crystal_count(:,1)>=0.85 & crystal_count(:,2)>=4 & crystal_count(:,5)==k);
    scatter(crystal_count(f,3),crystal_count(f,4),2,'b','filled');
    hold off
%     figure
%     BB=imread('C:\Users\Divya\Desktop\Test\Bandpass_data1\970.tif');
%     imshow(BB);
%     hold on
%     f=find(E2(:,1)>=0.85 & E2(:,2)>=4);
%     scatter(E2(f,3),E2(f,4),10,'b','filled');
%     hold off
    set(gcf,'WindowStyle','docked')
    fig = gcf;
    fig.PaperPositionMode = 'auto';
    print(strcat('E:\Devitrification\Experiment-1\crystalline_particles1\',num2str(k)),'-dtiff','-r600');
end