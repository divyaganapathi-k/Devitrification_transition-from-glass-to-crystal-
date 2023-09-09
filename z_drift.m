n=1380;
stack=7;
for i=1:10:n
    f=(pos_lst(:,4)==n & pos_lst(:,3)<=10 & pos_lst(:,3)>3);
    cnt=pos_lst(f,1:3);
    im=zeros(512,512,stack);
    for k=1:1:stack
        A=imread(strcat('H:\bandpass_data_zstack_sample5\Sample5_exp2_zstack.lif_Series003_t',num2str(i-1,'%03d'),'_z',num2str(k+2,'%03d'),'_ch00.tif'));
        im(:,:,k)=A;
    end
    imbp=bpass3d(im,[0.25 0.25],[5,5],0);
    im=mean(imbp(:,:,n1:n2),3);
    image(im);
    hold on
    scatter(cnt(f,1),cnt(f,2),4,'r','filled');
    hold off
    set(gcf,'WindowStyle','docked')
%     saveas(gcf,strcat('H:\Scatter_data\',num2str(i),'.tif'));
    print(strcat('E:\z_drift\',num2str(i)),'-dtiff','-r300');
end