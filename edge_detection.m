% I1=imread('E:\Devitrification\Bandpass_data\phi3\Set10\0373.tif');
% I=I(1:320,:);
I=imread('C:\Users\Divya\Desktop\1.tif');
% I=imcomplement(I);
I1=adapthisteq(I);
imshow(I1);
hold on
% I1=im2bw(I);
% r=1;
% n=0;
% J=I1;
% SE = strel('disk',r,n);
% SE = strel('arbitrary', 50)
% J = imerode(I1,SE);
% I1=watershed(I1);
% BW1 = edge(I,'Canny');
% BW2 = edge(I,'Prewitt');
% imshowpair(BW1,BW2,'montage')
% [Gmag, Gdir] = imgradient(I,'prewitt');
% imshowpair(Gmag, Gdir, 'montage');
% I = rgb2gray(RGB);
% bw = imbinarize(I);
% imshow(bw)
% [centers, radii, metric] = imfindcircles(I,[1 25]);
% scatter(centers(:,1),centers(:,2),20,'g','filled');
% patch(pos_lst(:,1:2),pos_lst(:,1:2));
% polyfit(pos_lst(:,1),pos_lst(:,2),1);
% [H,T,R] = hough(I1);
% figure
% imshow(imadjust(rescale(H)),'XData',T,'YData',R,...
%    'InitialMagnification','fit');
% title('Limited Theta Range Hough Transform of Gantrycrane Image');
% xlabel('\theta')
% ylabel('\rho');
% axis on, axis normal;
% colormap(gca,hot)
% s = regionprops(J,'centroid');
% centroids = cat(1, s.Centroid);
% imshow(I)
% hold on
% plot(centroids(:,1),centroids(:,2), 'b*')
% hold off