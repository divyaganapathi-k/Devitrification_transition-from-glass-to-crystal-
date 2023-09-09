% clearvars -except pos_lst
% pos_lst=gpuArray(pos_lst);
distance=37.4*1.4;
time=3;
% n1=min(pos_lst(:,time));
% n2=max(pos_lst(:,time));
psi6_all=[];
l=1;
% max(pos_lst(:,time))
for i=1:1:7500
    tic
    psi6_frame=[];  %#ok<NASGU>
    f=(pos_lst(:,time)==i);
    A=(pos_lst(f,:));
    A1=gpuArray(A);
    TRI=delaunay(A(:,1),A(:,2));
    TRI=gpuArray(TRI);
    psi6=gpuArray(zeros(length(A(:,1)),1));
    psi6_complex=gpuArray(zeros(length(A(:,1)),1));
    count=gpuArray(zeros(length(A(:,1)),1));
    for j=1:1:length(A1(:,1))
        f1=(any((TRI==j),2));
        B=unique(TRI(f1,:)); %contains indices of neighbours
        C=A1(B,1:2); %#ok<*PFBNS>
        D=A1(j,1:2);
        C(:,3)=C(:,1)-D(1,1);
        C(:,4)=C(:,2)-D(1,2);
        C(:,5)=(C(:,3).^2+C(:,4).^2).^(0.5);
        C(:,6)=atan2((C(:,3)),(C(:,4)));
        %distance cutoff
        f2=(C(:,5)~=0 & C(:,5)<=distance);
        E=C(f2,6);
        E=(exp(6i*E));
        g=mean(E);
        psi6_complex(j,1)=g;
        psi6(j,1)=abs(g);
        count(j,1)=sum(f2);
    end
    F1=(isnan(psi6)==0);
    G1=psi6(F1,1);
    psi6_time(l,1)=i;
    psi6_time(l,2)=gather(mean(G1,1));
    l=l+1;
    psi6_frame=horzcat(A(:,[1 2 3]),gather(psi6),gather(count),gather(psi6_complex));
%     psi6_frame(:,6)=i;
    psi6_all=vertcat(psi6_all,psi6_frame);
    toc
end