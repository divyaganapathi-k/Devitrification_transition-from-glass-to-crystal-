% % to find bond orientational correlation function
% %used to detect hexatic face in monomer system
% pos_lst=R;
clearvars -except pos_lst
% clearvars -except psi6_complex
distance=27.7;
%calculating psi6 complex for all the particles
% max(pos_lst(:,5))
psi6_complex=[];
time=4;
for i=1:1:1000
    f=(pos_lst(:,time)==i);
    A=pos_lst(f,[1 2 time]);
    TRI=delaunay(A(:,1),A(:,2));
    complex=zeros(length(A(:,1)),1);
    len=zeros(length(A(:,1)),1);
    parfor j=1:1:length(A(:,1))
        f1=(any((TRI==j),2));
        B=unique(TRI(f1,:)); %contains indices of neighbours
        C=A(B,1:2); %#ok<*PFBNS>
        D=A(j,1:2);
        C(:,1)=C(:,1)-D(1,1);
        C(:,2)=C(:,2)-D(1,2);
        C(:,3)=(C(:,1).^2+C(:,2).^2).^(0.5);
        C(:,4)=atan2((C(:,1)),(C(:,2)));
        %distance cutoff
        f2=(C(:,3)~=0 & C(:,3)<=distance);
        E=[];
        E(:,1)=(exp(6i.*C(f2,4)));
        F= isnan(E)==0;
        G=E(F,1);
        complex(j,1)=mean(G);
        len(j,1)=length(f2);
    end
    A=horzcat(A,complex,len); %#ok<AGROW>
    psi6_complex=vertcat(psi6_complex,A); %#ok<AGROW>
end
a=unique(psi6_complex(:,3));
% aa=length(a);
a1=max(psi6_complex(:,1));
a11=min(psi6_complex(:,1));
a2=max(psi6_complex(:,2));
a22=min(psi6_complex(:,2));
binsize=1;
%to define the central box
% f=(psi6_complex(:,1)>a1/4 & psi6_complex(:,1)<((3*a1/4)) & psi6_complex(:,2)>a2/4 & psi6_complex(:,2)<((3*a2/4)));
% H=psi6_complex(f,:);
% n=max(psi6_complex(:,3));
if a1>a2
    x=0:binsize:a2;
else
    x=0:binsize:a1;
end
%H contains the particles in the central box
%now g6(r) is averaged over all the particles in the central box
G6_r=zeros(length(x),1);
for i=1:1:1000
    f1=(psi6_complex(:,3)==i);
    A=psi6_complex(f1,:);
%     f2=(H(:,3)==i);
%     B=H(f2,:);
    C=pdist2(A(:,1:2),A(:,1:2));
    D=(conj(A(:,4)))*((A(:,4))');
    [m,n]=size(C);
    CC=reshape(C,[(m*n),1]);
    DD=reshape(D,[(m*n),1]);
    E=[];
    E(:,1)=discretize(CC,x);
    f=isnan(E);
    f=~f;
    E=E(f,:);
    DD=DD(f,:);
%     DD1=real(DD);
%     DD2=imag(DD);
    DD=abs(DD);
    g6_r=zeros(length(x)-1,1);
%     parfor j=1:1:length(x)
%         f=(E(:,1)==j);
%         g6_r(j,:)=nanmean(DD(f));
%     end
    g6_r(:,1)=accumarray(E(:,1),DD(:,1),[],@mean);
    t1=max((E(:,1)));
    if t1<length(x)
        g6_r((t1+1):length(x))=0;
    end
    G6_r=G6_r+g6_r;
end
G6_r=G6_r/1000;
G6_r(:,2)=x'/distance;
G6_r(:,3)=abs(G6_r(:,1));