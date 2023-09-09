% as suggested in PHYSICAL REVIEW E 75, 041503 2007
% psi6_complex(:,6)=angle(psi6_complex(:,4));
% psi6_complex=psi6_complex(:,[1 2 3 6]);
clearvars -except psi6_complex
psi6_disorder=[];
disorder_full=[];
distance=45.4;
k=12;
extra=100;
for i=1761:10:max(psi6_complex(:,3))
    f=(psi6_complex(:,3)==i);
    A=psi6_complex(f,:);
    [B,I] = pdist2(A(:,1:2),A(:,1:2),'euclidean','Smallest',k); 
    f=(B<=distance & B~=0);
    theta=A(I,4);
    theta=reshape(theta,[k,length(A)]);
    theta=bsxfun(@minus, theta, theta(1,:)); 
    f=double(f);
    f(f==0)=NaN;
    theta(1,:)=NaN;
    theta=theta.*f;
    theta=2*(1-cos(6.*(theta)));
    disorder=nanmean(theta);
    A=horzcat(A,disorder');
    psi6_disorder=vertcat(psi6_disorder,A);
    disorder_full=vertcat(disorder_full,disorder');
    patch([min(psi6_complex(:,1))-extra max(psi6_complex(:,1))+extra max(psi6_complex(:,1))+extra min(psi6_complex(:,1))-extra], [min(psi6_complex(:,2))-extra min(psi6_complex(:,2))-extra max(psi6_complex(:,2))+extra max(psi6_complex(:,2))+extra],'w');
    axis([min(psi6_complex(:,1))-extra max(psi6_complex(:,1))+extra min(psi6_complex(:,2))-extra max(psi6_complex(:,2))+extra])
    hold on
    scatter(A(:,1),A(:,2),8,disorder','filled');
    colormap(jet);
    caxis([0 4])
    axis equal
    axis off
    set(gcf,'WindowStyle','docked')
    fig = gcf;
    fig.PaperPositionMode = 'auto';
    hold off
    print(strcat('F:\Devitrification\Crystal1\Degree of disorder\old\',num2str(i)),'-dtiff','-r300');
end
disorder_av=zeros(max(psi6_disorder(:,3)),1);
parfor i=1:1:max(psi6_disorder(:,3))
    f=(psi6_disorder(:,3)==i);
    disorder_av(i,1)=mean(psi6_disorder(f,5));
end