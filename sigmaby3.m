%particles with more than sigma/3 displacements 
clearvars -except H 
t=25;%this is the deltat value where the nongaussian parameter has the peak
sigma=33.2;
H1=circshift(H,-t);
A=H1-H;
G=[];
X=find (A(:,4)==0 & A(:,3)==t);
G(:,1)=((A(X,1)).^2+(A(X,2)).^2).^0.5;
G(:,2:5)=H(X,1:4);
f=(G(:,1)>=(sigma/3));
% D contains the particles of interest
req_particles=G(f,:);
n=max(H(:,3));
binranges=1:n;
no_of_particles=histc(req_particles(:,4),binranges);
% for i=1:1:(max(H(:,3))-t)
%     f=(req_particles(:,4)==i);
%     patch([0 4096 4096 0], [0 0 4096 4096],'k');
%     hold on
%     axis([0 4096 0 4096])
%     axis equal
%     axis off
%     f1=(psi6_all_dedrift(:,6)==i & psi6_all_dedrift(:,4)<=0.5);
%     scatter(psi6_all_dedrift(f1,1),psi6_all_dedrift(f1,2),10,'b','filled');
% %        hold on
%     f2=(psi6_all_dedrift(:,6)==i & psi6_all_dedrift(:,4)>0.5 & psi6_all_dedrift(:,4)<=0.65);
%     scatter(psi6_all_dedrift(f2,1),psi6_all_dedrift(f2,2),10,'r','filled');
%     f3=(psi6_all_dedrift(:,6)==i & psi6_all_dedrift(:,4)>0.65 & psi6_all_dedrift(:,4)<=0.75);
%     scatter(psi6_all_dedrift(f3,1),psi6_all_dedrift(f3,2),10,'c','filled');
%     f4=(psi6_all_dedrift(:,6)==i & psi6_all_dedrift(:,4)>0.75);
%     scatter(psi6_all_dedrift(f4,1),psi6_all_dedrift(f4,2),10,'g','filled');
%     hold off
%     set(gcf,'WindowStyle','docked')
%     fig = gcf;
%     fig.PaperPositionMode = 'auto';
%     hold on
%     scatter(mostmobile(f,2),mostmobile(f,3),5,'y','filled');
%     hold off
%     h=gcf;
%     print(strcat('F:\Devitrification\Crystal1\Average_Images\sigmaby3\',num2str(i)),'-dtiff');
% end