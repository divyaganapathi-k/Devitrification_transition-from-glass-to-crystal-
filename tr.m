% phops=[];
% for i=403:1:600
%     phop_all1=circshift(phop_all,-i);
%     phop_all2=phop_all1-phop_all;
%     f=phop_all2(:,4)==i & phop_all2(:,5)==0;
%     A=[];
%     A(:,1)=abs(phop_all2(f,1));
%     A(:,2)=i;
%     phops=vertcat(phops,A);
% end
% time=zeros(1000,1);
for i=681:1:1000
    f=phops(:,1)>=(i*0.0001) & phops(:,1)<((i+1)*1000);
    time(i)=mean(phops(f,2));
end