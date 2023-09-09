% %input will be positions of the particle pos_lst
%calculating s2 for individual particles
% clearvars -except pos_lst
% sigma=33.2;
% sigmadip=46;
% bp=0.0000002;
% ex_ent=[];
% % exam=[];
% for i=1:10:max(pos_lst(:,5))
%     f=(pos_lst(:,5)==i);
%     A=pos_lst(f,1:2);
%     [B,I]=pdist2(A,A,'euclidean','Smallest',10);
%     f=(B<=sigmadip);
%     J1=B.*f;
%     J2=I.*f;
%     numeric=zeros(length(A(:,1)),1);
%     r=0:0.01:(sigmadip/sigma);
%     r=r';
%     res=zeros(length(A(:,1)),1);
%     for j=1:1:length(A(:,1))
%         rij= nonzeros(J1(:,j));
%         rij=rij/sigma;
%         fun=zeros(length(r),1);fun1=zeros(length(r),1);func=zeros(length(r),1);
%         for k=1:1:length(r)  
%             fun(k,1)=(sum(((2*pi*((bp).^2)).^(-0.5)).*(exp(-((r(k,1)-rij).^2))./(2*((bp).^2)))))./(2*pi*(0.55)*((r(k,1))));
%             fun1(k,1)=((fun(k,1).*log(fun(k,1)))-fun(k,1)+1);
%             func(k,1)=((fun(k,1).*log(fun(k,1)))-fun(k,1)+1).*((r(k,1)));
%             func=(func(~isnan(func)));
%         end
%         res(j,1)=-2*pi*(0.55)*1.38e-23*trapz(func);
%     end
%     res1=zeros(length(A(:,1)),1);
%     for j=1:1:length(A(:,1))
%         rij= nonzeros(J1(:,j));
%         rij=rij/sigma;
%         rij(:,2)=(1-(rij(:,1).^6))./(1-(rij(:,1).^12));
%         rij(:,3)=res(nonzeros(J2(2:end,j)));
%         res1(j,1)=(sum((rij(:,2)).*(rij(:,3)))+res(j,1))./((sum(rij(:,2)))+1);
%     end  
%     ex_entropy=horzcat(A,res,res1);
%     ex_entropy(:,5)=i;
%     ex_ent=vertcat(ex_ent,ex_entropy);
% end
f=unique(ex_ent(:,5));
for i=1:1:length(f)
%       patch([0 4096 4096 0], [0 0 4096 4096],'k');
%       hold on
      f1=(ex_ent(:,5)==f(i));
      scatter(ex_ent(f1,1),ex_ent(f1,2),7,ex_ent(f1,4),'filled');
      colormap(flipud(jet))
      axis([0 4096 0 4096])
      axis equal
      axis off
      hold on
      caxis([-7 -2]) 
      hold off
      set(gcf,'WindowStyle','docked')
      fig = gcf;
      fig.PaperPositionMode = 'auto';
      print(strcat('F:\Devitrification\Crystal1\excess_entropy4\',num2str(f(i))),'-dtiff','-r300');
end
