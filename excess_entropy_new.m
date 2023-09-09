% This code is written according to J. Phys.: Condens. Matter 30 (2018) 094003 (14pp)
% where a 2-D system's excess entropy is used and defined.
clearvars -except pos_lst %distances measured in pixel units
sigma=20;
fac=1;
distance=1.4*fac;
distance1=1.4*sigma;
delta=(0.12)*fac;
rho=0.88;
ex_ent=[];
for i=1:1:max(pos_lst(:,5))
    f=(pos_lst(:,5)==i);
    A=pos_lst(f,1:2);
    [B,I]=pdist2(A,A,'euclidean','Smallest',100);
    f=(B<=distance1);
    J1=B.*f;
    J1=J1/sigma;
    J1=J1*fac;
    J2=I.*f;
    numeric=zeros(length(A(:,1)),1);
    r=((distance/1000):(distance/1000):(distance))';
    res=zeros(length(A(:,1)),1);
    for j=1:1:length(A(:,1))
        rij= nonzeros(J1(:,j));
        fun=zeros(length(r),1);fun1=zeros(length(r),1);func=zeros(length(r),1);
        for k=1:1:length(r) 
            fun(k,1)=(1./(2.*pi.*(rho)*r(k,1))).*sum((1./(((2*pi).^(0.5)).*(delta))).*(exp(-((r(k,1)-rij).^2)./(2.*delta.*delta))));
            fun1(k,1)=((fun(k,1).*log(fun(k,1)))-fun(k,1)+1);
            func(k,1)=((fun(k,1).*log(fun(k,1)))-fun(k,1)+1).*((r(k,1)));
            func(isnan(func)) = 0;
%             func=(func(~isnan(func)));
        end
        res(j,1)=-(2)*pi*(rho)*trapz(r,func);
%         res(j,2)=trapz(r,func);
    end
    res1=zeros(length(A(:,1)),1);
    for j=1:1:length(A(:,1))
        I= nonzeros(J2(:,j));
        res1(j,1)=mean(res(I));
%         rij(:,2)=(1-(rij(:,1).^6))./(1-(rij(:,1).^12));
%         rij(:,3)=res(nonzeros(J2(2:end,j)));
%         res1(j,1)=(sum((rij(:,2)).*(rij(:,3)))+res(j,1))./((sum(rij(:,2)))+1);
    end  
    ex_entropy=horzcat(A,res,res1);
    ex_entropy(:,5)=i;
    ex_ent=vertcat(ex_ent,ex_entropy);
end
f=unique(ex_ent(:,5));
extra=200;
for i=1:10:length(f)
%       patch([0 4096 4096 0], [0 0 4096 4096],'k');
%       hold on
      f1=(ex_ent(:,5)==f(i));
      patch([min(ex_ent(:,1))-extra max(ex_ent(:,1))+extra max(ex_ent(:,1))+extra min(ex_ent(:,1))-extra], [min(ex_ent(:,2))-extra min(ex_ent(:,2))-extra max(ex_ent(:,2))+extra max(ex_ent(:,2))+extra],'w');
      axis([min(ex_ent(:,1))-50 max(ex_ent(:,1))+50 min(ex_ent(:,2))-50 max(ex_ent(:,2))+50])
      hold on
      scatter(ex_ent(f1,1),ex_ent(f1,2),100,ex_ent(f1,3),'filled');
      colormap(flipud(parula))
%       axis([0 4096 0 4096])
      axis equal
      axis off
      caxis([-10 -8.5]) 
      hold off
      set(gcf,'WindowStyle','docked')
      fig = gcf;
      fig.PaperPositionMode = 'auto';
%       print(strcat('F:\Devitrification\Crystal1\Grid_calculations\Excess_entropy\cryst_1\',num2str(f(i))),'-dtiff','-r300');
end
