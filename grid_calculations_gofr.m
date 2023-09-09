%static structure factor as a function of time
% clearvars -except psi6_all
% i=1; j=5;
% psi6_all=ex_ent;
% sz=256;
% f=(psi6_all(:,1)>=((i-1)*sz) & psi6_all(:,1)<(i*sz) & psi6_all(:,2)>=((j-1)*sz) & psi6_all(:,2)<(j*sz));
% coor=psi6_all(f,:);
% a1=max(coor(:,1));
% a11=min(coor(:,1));
% a2=max(coor(:,2));
% a22=min(coor(:,2));
% binsize=0.2;
% %to define the central box
% f=(coor(:,1)>(a11+((a1-a11)/4)) & coor(:,1)<(a11+(3*(a1-a11)/4)) & coor(:,2)>(a22+((a2-a22)/4)) & coor(:,2)<(a22+(3*(a2-a22)/4)));
% H=coor(f,:);
% n=max(coor(:,5));
% if a1>a2
%     x=binsize:binsize:a2/4;
% else
%     x=binsize:binsize:a1/4;
% end
% %H contains the particles in the central box
% %now g(r) is averaged over all the particles in the central box
% gr=zeros(length(x),2);
% gr(:,1)=x';
% GR=[];
% %averaging 50 frames and seeing the change with time
% l=2;
% for k=1:1:max(coor(:,6))
%     h=1;
%     for m=((k-1)*100):1:(k*100)
%         f1=(coor(:,6)==k);
%         A=coor(f1,1:2);
%         f2=(H(:,6)==k);
%         B=H(f2,1:2);
%         n1=length(B(:,1));
%         n2=length(A(:,1));
%         C=pdist2(B,A);
%         [m1,m2]=size(C);
%         D=reshape(C,[(m1*m2),1]);
%         G=((a1/2)*(a2/2)*histc(D,x))./(2*n1*n1*pi*x');
%         GR=horzcat(GR,G);
%         gr(:,l)=(5)*(sum(GR,2)/h);
%         l=l+1;
%         h=h+1;
%     end
% %     print(strcat('F:\Devitrification\Crystal1\Grid_calculations\g_r\1,5\',num2str(k)),'-dtiff','-r300');
% end   
excess_ent=zeros(round(max(coor(:,5))/10),2);
l=1;
for i=1:10:max(coor(:,5))
    f=(coor(:,5)==i);
    excess_ent(l,1)=i;
    excess_ent(l,2)=mean(coor(f,4));
    l=l+1;
end