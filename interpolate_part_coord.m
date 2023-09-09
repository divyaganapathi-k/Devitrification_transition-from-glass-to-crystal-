% this is to include crystalline particles which was not trackable and not 
% correcting for the ones which were not picked up in the centre exactly

% clearvars -except psi6_all pos_lst_corrected
% sigma=13;
% n=25;
% B=1:max(psi6_all(:,3));
% B=B';
% pos={n,n};
% l=1;
% for i=1:1:n
%     a=sigma*i;
%     parfor j=1:1:n
%         b=sigma*j;
%         f=(psi6_all(:,1) >= (a-sigma) & psi6_all(:,1) < a & psi6_all(:,2) >= (b-sigma) & psi6_all(:,2) < b);
%         pos{i,j}=psi6_all(f,:);
%         l=l+1;
%     end
% end 
% pos has cells for each (i,j) having coordinates of particles present at
% that position in x,y at all t.

%now interpolate particles in each cell
for i=3:1:n
    a=sigma*i;
    for j=3:1:n
       A=pos{i,j};
       A1=pos{i,j};
       if (isempty(A)==0 && length(A)>=800)
           b=sigma*j;
           C=setdiff(B,A(:,3));
%            difference=[];
%            difference(:,1)=abs(A(:,1)-(a-sigma));
%            difference(:,2)=abs(A(:,1)-a);
%            difference(:,3)=abs(A(:,2)-b);
%            difference(:,4)=abs(A(:,2)-(b-sigma));
           % see whether the particle is there in the edge of the box
           % and moved to the adjacent boxes
           %to remove those time series which need not require time series
           for k=1:1:4
               if k==1
                   c1=i-1; c2=j;
               elseif k==2
                   c1=i+1; c2=j;
               elseif k==3
                   c1=i; c2=j-1;
               elseif k==4
                   c1=i; c2=j+1;
               end
               D=pos{c1,c2};
               [E, ia, ib]=intersect(C,D(:,3)); %need to use ib
               F=D(ib,:);
               F(:,6)=F(:,3)-1;
               [G, ic, id]=intersect(F(:,6),A(:,3)); % need to use ic and id
               H=circshift(F,-1);
               H=H-F;
               H(:,7)=(H(:,1).^2+H(:,2).^2).^(0.5);
               H=horzcat(H,F);
               
               %assigning all of the coordinates belong to the same
               %particle and not to be used for interpolation             
           end
           % if this is absent then do the interpolation
           % by first method- lower cut off of intensity and particle
           % coordinate is found
           for k=1:1:length(C)
               f1=find(A(:,3)==(C(k)-1));
               f2=find(A(:,3)==(C(k)+1));
               if isempty(f1)==0 || isempty(f2)==0
                  coor1=A(f1,:);
                  coor2=A(f2,:);
               end
           end
       end 
    end
end 