% for i=1:1:max(pos_lst(:,6))
%     f=pos_lst(:,6)==i;
%     A=pos_lst(f,:);
%     [V,C]=voronoin(A(:,1:3));
% end
voro=[];
for i=1:1:max(pos_lst(:,3))
    f=pos_lst(:,3)==i;
    A=pos_lst(f,:);
    [V,C]=voronoin(A(:,1:2));
    for j = 1:length(C) 
        if all(C{j}~=1)   % If at least one of the indices is 1, 
                          % then it is an open region and we can't 
                          % patch that.
            A(j,4)= polyarea(V(C{j},1),V(C{j},2)); 
            A(j,5)=length(C{j});
        else
            A(j,4)=0;
            A(j,5)=0;
        end
    end
    voro=vertcat(voro,A);
end