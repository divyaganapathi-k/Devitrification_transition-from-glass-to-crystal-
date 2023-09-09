% PSI 6 & PSI 4
clearvars -except mat_xyt
dd_Res_1=mat_xyt(:,[1 2 6]);;
%clearvars -except dd_Res_1
max_fr=max(dd_Res_1(:,3));
%nn(:,:)=0;
psi6(:,:)=0;
psi4(:,:)=0;
tic
to   = 'degrees';
from = 'radian';
for jn=1:1:200
 k= find (dd_Res_1(:,3)==jn);
 X1=dd_Res_1(k,1);
 Y1=dd_Res_1(k,2);
 TRI_ch = delaunay(X1,Y1);
 jn
 max_ind=max(TRI_ch);
 min_ind=min(TRI_ch);
 n=0;
 lentri=length(TRI_ch);
 for l=1:1:lentri
     v1=TRI_ch(l,1);
     v2=TRI_ch(l,2);
     v3=TRI_ch(l,3);
 TRI_ch(l,4)=sqrt((X1(v1)-X1(v2))^2 + (Y1(v1)-Y1(v2))^2);
 TRI_ch(l,5) =sqrt((X1(v2)-X1(v3))^2 + (Y1(v2)-Y1(v3))^2);
 TRI_ch(l,6)=sqrt((X1(v1)-X1(v3))^2 + (Y1(v1)-Y1(v3))^2);
 a=TRI_ch(l,4);
 b=TRI_ch(l,5);
 c=TRI_ch(l,6);
 a2=TRI_ch(l,4)^2;
 b2=TRI_ch(l,5)^2;
 c2=TRI_ch(l,6)^2;
 %Finding angles
       TRI_ch(l,7)=acos((a2+c2-b2)/(2*a*c));
       ThetaD(l,1)=unitsratio(to, from) * TRI_ch(l,7);
       TRI_ch(l,8)=acos((a2+b2-c2)/(2*a*b));
       ThetaD(l,2)=unitsratio(to, from) * TRI_ch(l,8);
       TRI_ch(l,9)=acos((b2+c2-a2)/(2*b*c));
       ThetaD(l,3)=unitsratio(to, from) * TRI_ch(l,9);
 %End of this for
 end
for n=min_ind:1:max_ind
   psi6(n,3)= X1(n);
   psi6(n,4)=Y1(n);
   nn(n,2)= Y1(n);  
   %when its vertex1
   ser=find(TRI_ch(:,1)==n &((abs(TRI_ch(:,4))<=25|(abs(TRI_ch(:,6))<25))));
   nn1=0;
   nn1=length(ser(:,1));
   psi6(n,2)=nn1;
   psi6(n,1)=0;
   psi4(n,1)=0;
% nns=0;
   for m=1:1:nn1
     p=ser(m,1);
     o1=TRI_ch(p,7);
     psi6(n,1)=psi6(n,1)+abs(real(exp(-6*1j*(o1))));%o1 complex
     psi4(n,1)=psi4(n,1)+abs(real(exp(-4*1j*(o1))));
   end  
  
   %when its vertex2
   ser=find(TRI_ch(:,2)==n &((abs(TRI_ch(:,5))<=25) | (abs(TRI_ch(:,4))<=25)));
   nn1=0;
   nn1=length(ser(:,1));
   psi6(n,2)=nn1+psi6(n,2);

    for m=1:1:nn1
     p=ser(m,1);
     o2=TRI_ch(p,8);
     psi6(n,1)=psi6(n,1)+abs(real(exp(-6*1j*(o2))));
     psi4(n,1)=psi4(n,1)+abs(real(exp(-4*1j*(o2))));
    end  
   
    %when its vertex3
   ser=find(TRI_ch(:,3)==n &((abs(TRI_ch(:,6))<25) |(abs(TRI_ch(:,5))<=25)));
   nn1=0;
   nn1=length(ser(:,1));
   psi6(n,2)=nn1+psi6(n,2);
   for m=1:1:nn1
       p=ser(m,1);
       o3=TRI_ch(p,9);
       psi6(n,1)=psi6(n,1)+abs(real(exp(-6*1j*(o3))));
       psi4(n,1)=psi4(n,1)+abs(real(exp(-4*1j*(o3))));
   end     
  psi6i(n,1)=(psi6(n,1)/psi6(n,2));
  psi4i(n,1)=(psi4(n,1)/psi6(n,2)); 
 end
% hist(psi6i,100);
% h1=gcf;
% %saveas(h1,(strcat('E:\Dibyashree\matlab coding_Dibyashree\psi62dbulk\psi6i',num2str(jn),'.tif')));
% hist(psi4i,100);
% h=gcf;
% %saveas(h,(strcat('E:\Dibyashree\matlab coding_Dibyashree\psi42dbulk\psi4i',num2str(jn),'.tif')));

%PSI6 COLOR CODED

%Kmax=max(psi6(:,2));
%Kmin=min(psi6(:,2));
% scatter(psi6(:,3),psi6(:,4),10,psi6i(:,1),'o');
%  h2=gcf;
%  caxis('manual');
%  caxis([0.2,0.7]);
%  colormap(hsv);
%   colorbar
%  h4=colorbar;
%  hold on
% % axis off
%  saveas(h2,(strcat('F:\Dibyashree\Data_phi1analysis\lpsi6_4\id_',num2str(jn),'.tif')));
%  hold off
%  Im=imread('D:\Dibyashree_2\Phi2_10042015_bulkdevit\phi2_devit_set1 bpassImj.tif',jn);
  %colormap('gray')
  %imagesc(Im)
 % axis square
  %axis off
  %hold on
%   num=length(k);
%   crys_6=find(psi6i(:,1));
%   Xcrys_6(jn,2)=(length(crys_6))/num ;
%   Xcrys_6(jn,1)=jn;
%   crys_4=find(psi6i(:,1));
%   Xcrys_4(jn,2)=(length(crys_4))/num ;
%   Xcrys_4(jn,1)=jn;
    crys_6(jn,1)=jn;
    crys_6(jn,2)=mean(psi6i);
%  % 
 % hold on
  %crys4=find(psi4i(:,1)>=0.5);
  %Xcrys4=length(crys4);
  %scatter(psi6(crys4,3),psi6(crys4,4),10,'g');
%  h7=gcf;
 % saveas(h7,(strcat('D:\Dibyashree_2\Phi2_10042015_bulkdevit\crys_hex_set2\hexcrys',num2str(jn),'.tif')));
  %psi4 colour coded
 %scatter(psi6(:,3),psi6(:,4),8,psi4i(:,1));
% h5=gcf;
  %caxis('manual');
 % caxis([0,1]);
 % colormap(hsv);
  %colorbar
 % h4=colorbar;
 %saveas(h5,(strcat('D:\Dibyashree_2\Phi2_10042015_bulkdevit\psi4_set1\ps4c',num2str(jn),'.tif')));
% hold off

% hold off
end
toc