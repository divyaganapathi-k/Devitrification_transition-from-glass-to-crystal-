% clearvars
% k=1;
% extra=200;
% for j=1:1:1
%     for i=1:10:max(psi6_all(:,6))
%         patch([min(psi6_all(:,1))-extra max(psi6_all(:,1))+extra max(psi6_all(:,1))+extra min(psi6_all(:,1))-extra], [min(psi6_all(:,2))-extra min(psi6_all(:,2))-extra max(psi6_all(:,2))+extra max(psi6_all(:,2))+extra],'w');
%         hold on
%         axis([min(psi6_all(:,1))-50 max(psi6_all(:,1))+50 min(psi6_all(:,2))-50 max(psi6_all(:,2))+50])
%         axis equal
%         axis off
%         f1=(psi6_all(:,6)==i & psi6_all(:,4)<=0.5);
%         scatter(psi6_all(f1,1),psi6_all(f1,2),250,'b','filled');
%         f2=(psi6_all(:,6)==i & psi6_all(:,4)>0.5 & psi6_all(:,4)<=0.65);
%         scatter(psi6_all(f2,1),psi6_all(f2,2),250,'r','filled');
%         f3=(psi6_all(:,6)==i & psi6_all(:,4)>0.65 & psi6_all(:,4)<=0.75);
%         scatter(psi6_all(f3,1),psi6_all(f3,2),250,'c','filled');
%         f4=(psi6_all(:,6)==i & psi6_all(:,4)>0.75);
%         scatter(psi6_all(f4,1),psi6_all(f4,2),250,'g','filled');
%         hold off
%         set(gcf,'WindowStyle','docked')
%         fig = gcf;
%         fig.PaperPositionMode = 'auto';
%         print(strcat('F:\Devitrification\Crystal1\Grid_calculations\psi6\Cryst_1\',num2str(i)),'-dtiff');
%         k=k+1;
%     end
% end
 psi6=zeros(max(psi6_all(:,6)),1);
for i=1:1:max(psi6_all(:,6))
    f=(psi6_all(:,6)==i);
    psi6(i,1)=mean(psi6_all(f,4));
end