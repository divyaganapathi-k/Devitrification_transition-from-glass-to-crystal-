% [~,ia,ib]=intersect(R(:,1:2),psi6_all(:,1:2),'rows');
% H=horzcat(H(ia,:),psi6_all(ib,4:5));
% H=sortrows(H,[4 3]);
clearvars -except H
f=H(:,1)>2262 & H(:,1)<2553 & H(:,2)>3026 & H(:,2)<3360;
H1=H(f,:);
f=H1(:,3)>=1475 & H1(:,3)<=7515;
H2=H1(f,:);
A=accumarray(H2(:,4),1);
B=find(A>100);
Lia=ismember(H2(:,4),B);
H2=H2(Lia,:);
D=[];
for i=1:1:length(B)
    f=H2(:,4)==B(i);
    C=H2(f,5);
    C=smooth(C,10);
    D=vertcat(D,C);
end
H2=horzcat(H2,D);
H3=circshift(H2,-100);
E=H3-H2;
f=E(:,3)==100 & E(:,4)==0;
E=E(f,:);
E(:,8)=(E(:,1).^2+E(:,2).^2).^(0.5);
f=E(:,7)>0.25;
pos_res=E(f,8);
f=E(:,7)<-0.25;
neg_res=E(f,8);
dis=E(:,8);
% pos_change=vertcat(pos_change,pos_res);
% neg_change=vertcat(neg_change,neg_res);
pos_change=pos_res;
neg_change=neg_res;

dis(:,2)=dis(:,1)/37.8;
pos_change(:,2)=pos_change(:,1)/37.8;
neg_change(:,2)=neg_change(:,1)/37.8;
A=histc(dis(:,2),0:0.05:1);
A=A/length(dis(:,2));
B=histc(pos_change(:,2),0:0.05:1);
B=B/length(dis(:,2));
C=histc(neg_change(:,2),0:0.05:1);
C=C/length(dis(:,2));
y=0:0.05:1;
y=y';
D=horzcat(y,A,B,C);