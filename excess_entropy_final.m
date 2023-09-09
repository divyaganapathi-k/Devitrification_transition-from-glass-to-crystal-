% %input will be positions of the particle pos_lst
% calculating s2 for individual particles
% pos_lst=H1;
clearvars -except pos_lst
sigma=38;
sigmadip=1.4*sigma;
bp=0.1;
rho=0.54;
ex_ent=[];
% exam=[];
% max(pos_lst(:,3))
for i=1:1:2000
    f=(pos_lst(:,3)==i);
    A=pos_lst(f,1:2);
    [B,I]=pdist2(A,A,'euclidean','Smallest',10);
    f=(B<=sigmadip);
    J1=B.*f;
    J2=I.*f;
    numeric=zeros(length(A(:,1)),1);
    r=0:0.01:(sigmadip/sigma);
    r=r';
    res=zeros(length(A(:,1)),1);
    func=zeros(length(r),1);
%     length(A(:,1))
    for j=1:1:length(A(:,1))
        rij= nonzeros(J1(:,j));
        rij=rij/sigma;
        fun=zeros(length(r),1);fun1=zeros(length(r),1);
        for k=1:1:length(r)
            a=exp(-(((r(k,1)-rij).^2)./(2*((bp).^2))));
            b=sum(a);
            fun(k,1)=(1/(2*pi*(r(k,1))*(rho)))*((1/(2*pi*((bp).^2)))^(0.5))*b;
%             fun(k,1)=(sum(((2*pi*((bp).^2)).^(-0.5)).*(exp(-((r(k,1)-rij).^2))./(2*((bp).^2)))))./(2*pi*(rho)*((r(k,1))));
            fun1(k,1)=((fun(k,1).*log(fun(k,1)))-fun(k,1)+1);
            func(k,1)=((fun(k,1).*log(fun(k,1)))-fun(k,1)+1).*(((r(k,1))));
            func=(func(~isnan(func)));
        end
        res(j,1)=-pi*0.01*(rho)*trapz(func);
%        func=func+fun;
    end
    
    res1=zeros(length(A(:,1)),1);
    for j=1:1:length(A(:,1))
        rij= nonzeros(J1(:,j));
        rij=rij/sigma;
        rij(:,2)=(1-(rij(:,1).^6))./(1-(rij(:,1).^12));
        a=isnan(rij(:,2));
        rij(a,2)=0.5;
        rij(:,3)=res(nonzeros(J2(2:end,j)));
        res1(j,1)=(sum((rij(:,2)).*(rij(:,3)))+res(j,1))./((sum(rij(:,2)))+1);
    end  
    ex_entropy=horzcat(A,res,res1);
    ex_entropy(:,5)=i;  
    ex_ent=vertcat(ex_ent,ex_entropy);
end
% f=unique(ex_ent(:,5));
% extra=200;
% for i=1:10:length(f)
% %       patch([0 4096 4096 0], [0 0 4096 4096],'k');
% %       hold on
%       f1=(ex_ent(:,5)==f(i));
%       patch([min(ex_ent(:,1))-extra max(ex_ent(:,1))+extra max(ex_ent(:,1))+extra min(ex_ent(:,1))-extra], [min(ex_ent(:,2))-extra min(ex_ent(:,2))-extra max(ex_ent(:,2))+extra max(ex_ent(:,2))+extra],'w');
%       axis([min(ex_ent(:,1))-50 max(ex_ent(:,1))+50 min(ex_ent(:,2))-50 max(ex_ent(:,2))+50])
%       hold on
%       scatter(ex_ent(f1,1),ex_ent(f1,2),250,ex_ent(f1,4),'filled');
%       colormap(flipud(jet))
% %       axis([0 4096 0 4096])
%       axis equal
%       axis off
%       caxis([-6 -2]) 
%       hold off
%       set(gcf,'WindowStyle','docked')
%       fig = gcf;
%       fig.PaperPositionMode = 'auto';
%       print(strcat('F:\Devitrification\Crystal1\Grid_calculations\Excess_entropy\cryst_1\',num2str(f(i))),'-dtiff','-r300');
% end
