%to define Q6 in order to quantify hexagonal order in 3D systems
%used an arbitrary reference axis (here X axis) and defined bond between
%particles with respect to it
% clearvars -except hcp
% pos_lst=hcp;
% pos_lst=pos_lst';
% pos_lst(:,4)=1;
% clearvars -except stack
% pos_lst=stack;
% tic
% clearvars -except pos_lst
sigmadip=19*1.4;
% sigmadip=1.1;
l=6;
m=-l:1:l;
n=max(pos_lst(:,6));
Q6=zeros(n,2);
% for k=1:1:l+1
%     m=k-1;
%     LUT(:,k)=((((2*l)+1)/(4*pi))*((factorial(l-m))/(factorial(l+m))))^(0.5);
% end
% the above for loop is the calculation of prefactor for Ylm without (-1)^m
% for m=0:1:l
Local_bond_ord=[];
Global_bond_ord=[];
for i=1:1:max(pos_lst(:,6))
    % nearest neighbours detection
    f=(pos_lst(:,6)==i);
    coor=pos_lst(f,[1 2 3 6]);
%     coor=coor(2001:4000,:);
    [dist,I]=pdist2(coor(:,1:3),coor(:,1:3),'euclidean','Smallest',16);
% %     toc
    f=dist<=sigmadip;
% % %     neighbours=1;
    I=I.*f;
%     I=I(2:end,:);
    local_bond_ord_param=zeros(length(coor),17);
    glob_bond_ord_param=zeros(length(coor),18);
    spherical_coor=[];
    %how particles are oriented in the first shell
    parfor j=1:1:length(coor(:,1))
        JJ=nonzeros(I(:,j));
        R=coor(JJ,:); %nearest neighbours for the jth particle(to remove the coordinates of particle of interest)
        R=bsxfun(@minus,R,R(1,:));
        R=R(2:end,:);
        if isempty(R)==0
            %transformation to spherical coordinates (sph_coor to be read as theta,phi,r)
            sph_coor=zeros((length(R(:,1))),3);
            [sph_coor(:,1),sph_coor(:,2),sph_coor(:,3)]=cart2sph(R(:,1),R(:,2),R(:,3));
            spherical_coor=vertcat(spherical_coor,sph_coor);
            %conversion of angles to the required limits
            % to convert (-pi pi) to (0 2pi)
            f=sph_coor(:,1)<0;
            sph_coor(f,1)=(2*pi)+sph_coor(f,1);
            sph_coor(:,2)=(pi/2)-sph_coor(:,2); %matlab measures latitude but in conventional physics colatitude is used 
            %to calculate spherical harmonics for the particle of interest(Ylm's in terms of legendre polynomials)
            %positive part of the spherical harmonics
            phi_pos=zeros(length(sph_coor(:,1)),7);
            phi_neg=zeros(length(sph_coor(:,1)),7);
            Leg=legendre(l,cos(sph_coor(:,2)));
            Leg=Leg';
            for k=1:1:l+1
                m=k-1;
                phi_pos(:,k)=((((2*l)+1)/(4*pi))*((factorial(l-m))/(factorial(l+m))))^(0.5).*exp(1i*m*sph_coor(:,1));
    %             m=-m; *((factorial(l-m))/(factorial(l+m)))
                phi_neg(:,k)=((-1)^(m)).*((((2*l)+1)/(4*pi)).*((factorial(l-m))/(factorial(l+m))))^(0.5).*exp(-1i*m*sph_coor(:,1));
            end
            Ylm_ind_pos=Leg.*phi_pos;
            Ylm_ind_neg=Leg.*phi_neg;
            Ylm_ind_neg=Ylm_ind_neg(:,2:end);
            Ylm_ind_neg=fliplr(Ylm_ind_neg);
            Ylm=horzcat(Ylm_ind_neg,Ylm_ind_pos);
            qlm=mean(Ylm,1);
        else
            qlm=zeros(1,13);
        end
        local_bond_ord_param(j,:)=horzcat(coor(j,:),qlm);
    end
    %includes information of the second shell
    for j=1:1:length(local_bond_ord_param(:,1))
        JJ=nonzeros(I(:,j));
        R=local_bond_ord_param(JJ,5:17);
        qbarlm=mean(R,1);
        glob_bond_ord_param(j,1:17)=horzcat(coor(j,:),qbarlm);
    end
    absolute_values1=(abs(local_bond_ord_param(:,5:17))).^2;
    local_bond_ord_param(:,18)=(((4*pi)/13)*sum(absolute_values1,2)).^(0.5);
    absolute_values2=(abs(glob_bond_ord_param(:,5:17))).^2;
    glob_bond_ord_param(:,18)=(((4*pi)/13)*sum(absolute_values2,2)).^(0.5);
    Q6(i,1)=i;
    Q6(i,2)=mean(glob_bond_ord_param(:,18));
    Local_bond_ord=vertcat(Local_bond_ord,local_bond_ord_param);
    Global_bond_ord=vertcat(Global_bond_ord,glob_bond_ord_param);
end
% toc

% xt=zeros(300,2);
% for i=1:1:max(Global_bond_ord(:,4))
%     f1=Global_bond_ord(:,4)==i;
%     A=Global_bond_ord(f1,:);
%     f2=A(:,18)>=0.25;
%     xt(i,1)=length(A(:,1));
%     xt(i,2)=sum(f2);
% end