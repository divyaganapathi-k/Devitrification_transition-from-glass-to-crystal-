%to plot the most mobile particles and cluster them
% Dynamic heterogeneity
% i=7; j=5;
% f=(psi6_all(:,1)>=((i-1)*512) & psi6_all(:,1)<(i*512) & psi6_all(:,2)>=((j-1)*512) & psi6_all(:,2)<(j*512));
% psi6_all=psi6_all(f,:);
% f=(H1(:,1)>=((i-1)*512) & H1(:,1)<(i*512) & H1(:,2)>=((j-1)*512) & H1(:,2)<(j*512));
% R=H1(f,:);
clearvars -except R
t=25; %this is the deltat value where the nongaussian parameter has the peak
H=circshift(R,-t);
% to plot the histogram
A=H-R;
G=[];
X=(A(:,4)==0 & A(:,3)==t);
G(:,1)=((A(X,1)).^2+(A(X,2)).^2).^0.5;
G(:,2:6)=R(X,1:5);
G(:,7)=H(X,5);
% selecting 10% of the particles and defining them as most mobile particles
c=floor(0.1*length(G(:,1)));
[E,IX]=sort(G(:,1),'descend');
F=IX(1:c);
mostmobile=G(F,:);  
clearvars -except mostmobile R