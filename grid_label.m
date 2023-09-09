% clearvars -except psi6_all
l=1;
a=6;
b=4;
len=4096;
z=[];
for i=6577:1:max(psi6_all(:,a))
    patch([0 len len 0], [0 0 len len],'w');
    hold on
    axis([0 len 0 len])
    axis equal
    axis off
    set(gca,'Ydir','reverse')
    f1=(psi6_all(:,a)==i & psi6_all(:,b)<=0.5);
    scatter(psi6_all(f1,1),psi6_all(f1,2),8,'b','filled');
    f2=(psi6_all(:,a)==i & psi6_all(:,b)>0.5 & psi6_all(:,b)<=0.65);
    scatter(psi6_all(f2,1),psi6_all(f2,2),8,'r','filled');
    f3=(psi6_all(:,a)==i & psi6_all(:,b)>0.65 & psi6_all(:,b)<=0.75);
    scatter(psi6_all(f3,1),psi6_all(f3,2),8,'c','filled');
    f4=(psi6_all(:,a)==i & psi6_all(:,b)>0.75);
    scatter(psi6_all(f4,1),psi6_all(f4,2),8,'g','filled');
    for k = 1:256:4096
        x = [1 4096];
        y = [k k];
        plot(x,y,'Color','m','LineStyle','-','LineWidth',2);
        plot(x,y,'Color','k','LineStyle',':','LineWidth',2);
    end
    for k = 1:256:4096
        x = [k k];
        y = [1 4096];
        plot(x,y,'Color','m','LineStyle','-','LineWidth',2);
        plot(x,y,'Color','k','LineStyle',':','LineWidth',2);
    end
    x=128:256:4096;
    y=128:256:4096;
    XY=(combvec(x,y))';
    z(1,:)=1:1:256; 
    allOneString=sprintf('%.0f,' , z);
    allOneString=allOneString(1:end-1);% strip final comma
    aa=strsplit(allOneString,',');
    allOneString1=sprintf('%.0f,' ,f);
    allOneString1=allOneString1(1:end-1);
    bb=strsplit(allOneString1,',');
%     cc=strcat(aa,bb);
    text(XY(:,2),XY(:,1),aa,'FontSize',10,'FontWeight','bold','HorizontalAlignment','center');
    text(XY(:,2)-100,XY(:,1)-100,bb,'FontSize',15,'FontWeight','bold','HorizontalAlignment','left','Color','red');
    l=l+1;
    set(gcf,'WindowStyle','docked')
    fig = gcf;
    fig.PaperPositionMode = 'auto';
    hold off
%     print(strcat('C:\Users\Divya\Desktop\Crystal3\psi63\',num2str(i)),'-dtiff','-r300');
end
