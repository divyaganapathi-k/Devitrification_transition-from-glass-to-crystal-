tstar=101;
f=(H1(:,3)<=2000);
G=H1(f,:); % G is the required track file
G1=circshift(G,-tstar);
A=[];
A=G1-G;
A(:,5:8)=G(:,1:4);
f=(A(:,3)==tstar & A(:,4)==0);
B=A(f,:);
B(:,9)=(B(:,1).^2+B(:,2).^2).^(0.5);
% hist(B(:,9))
C=sortrows(B,-9);
l=round((0.1)*length(C(:,9)));
D=C(1:l,:);
for i=1:1:2000
    f=(D(:,7)==i);
    f1=(H1(:,3)==i);
    scatter(H1(f1,1),H1(f1,2),10,'k','filled');
    hold on
    scatter(D(f,5),D(f,6),150,'b','filled');
    axis([1024 1536 2048 2560])
    axis equal
    axis off
    set(gcf,'WindowStyle','docked')
    hold off
    print(strcat('D:\mostmobile\',num2str(i)),'-dtiff'); 
end
