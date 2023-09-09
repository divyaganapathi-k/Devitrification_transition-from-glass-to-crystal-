coor=[];
sz=256;
for i=1:1:length(a)
     f=(ex_ent(:,1)>=(((a(i,1))-1)*sz) & ex_ent(:,1)<((a(i,1))*sz) & ex_ent(:,2)>=(((a(i,2))-1)*sz) & ex_ent(:,2)<((a(i,2))*sz));
     A=ex_ent(f,:);
     coor=vertcat(coor,A);
end
% psi6=zeros(max(coor(:,6)),2);
% for i=1:1:max(coor(:,6))
%     f=(coor(:,6)==i);
%     psi6(i,1)=i;
%     psi6(i,2)=mean(coor(f,4));
% end

