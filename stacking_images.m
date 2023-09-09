% for i=1:1:12
%     A=imread(strcat('E:\New folder\',num2str(i-1,'%04d'),'.tif'));
%     im(:,:,i)=A;
% end
im=double(im);
hf2 = figure ;
hs = slice(im,[],[],1:12) ;
shading interp
set(hs,'FaceAlpha',0.8);