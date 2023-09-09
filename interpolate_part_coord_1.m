%adding particle coordinates from a lower cut off
clearvars -except psi6_all pos_lst
distance=21.35;
psi6_corrected = [];
f = find(psi6_all(:,3)==1);
psi6_corrected = vertcat(psi6_corrected,psi6_all(f,:));
for i=1:1:(max(psi6_all(:,3))-1)
    f1 = psi6_all(:,3) == i;
    f2 = psi6_all(:,3) == i+1;
    A = psi6_all(f1,:);
    B = psi6_all(f2,:);
    B1=B;
    C1 = pdist2(A(:,1:2),B(:,1:2));
    f = pos_lst(:,5) == i+1;
    D = pos_lst(f,:);
    C2 = pdist2(A(:,1:2),D(:,1:2));
    [D1, D2] = min(C1,[],2);
    [D3, D4] = min(C2,[],2);
    f = find(D1 >= 5);
    coor_no_countpart=[];
%     A(f(j),4) >= 0.7 &&
    if isempty(f) == 0
        parfor j = 1:1:length(f)
           A1 = A(f(j),:);  %coordinate which does not have counterpart in i+1 frame
           A2 = D(D4(f(j)),:);  %coordinate of that particle which has least distance with the particle with lower cutoff
           if  D3(f(j)) <= 5
               B = vertcat(B,A2); %coordinate of the missing particle
               coor_no_countpart=vertcat(coor_no_countpart,A1);
           end
        end
    end
    %find out the coordinates of the missing particle
    TRI = delaunay(B(:,1),B(:,2));
    l=length(B1(:,1));
    psi6 = zeros((length(B(:,1))-length(B1(:,1))-1),1);
    count = zeros((length(B(:,1))-length(B1(:,1))-1),1);
    parfor j = (length(B1(:,1))+1):1:length(B(:,1))
        f1 = (any((TRI==j),2));
        BB = unique(TRI(f1,:)); %contains indices of neighbours
        CC = B(BB,1:2); %#ok<*PFBNS>
        DD = B(j,1:2);
        CC(:,1) = CC(:,1)-D(1,1);
        CC(:,2) = CC(:,2)-D(1,2);
        CC(:,3) = (CC(:,1).^2+CC(:,2).^2).^(0.5);
        CC(:,4) = atan2((CC(:,1)),(CC(:,2)));
        %distance cutoff
        f2 = find(CC(:,3) ~= 0 & CC(:,3) <= distance);
        EE=[];
        EE(:,1)=(exp(6i.*CC(f2,4)));
        FF = isnan(EE)==0;
        G = EE(FF,1);
        g = mean(G);
        psi6(j-l,1) = abs(g);
        count(j-l,1) = length(f2);
    end
    %check whether the psi6 is consistant with the previous time coordinate
    psi6 = psi6-coor_no_countpart(:,4);
    B(((l+1):end),3)=i+1;
    B(((l+1):end),4)=psi6;
    B(((l+1):end),5)=count;
    f = abs(psi6) >= 0.02;
    f = f+l;
    B(f,:) = [];
    psi6_corrected = vertcat(psi6_corrected,B);
end