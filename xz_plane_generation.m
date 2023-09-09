n=1;
p=2;
stack=236;
im=zeros(1053,1066,stack);
for i=1:1:1
    for k=1:1:stack
       A=imread(strcat('H:\Sample5_dedrifted_imagej_587\t',num2str(i,'%03d'),'_z',num2str(k,'%03d'),'_c1.tif'));
       im(:,:,k)=A;
    end
end
imp=permute(im,[1 3 2]);
imshow(imp(:,:,1));
image(imp(:,:,1));