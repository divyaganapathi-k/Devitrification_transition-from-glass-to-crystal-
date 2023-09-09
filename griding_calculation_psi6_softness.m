clearvars -except psi6_all req_coor
psi6=gpuArray(zeros(132,64));
psi6_abs=gpuArray(zeros(132,64));
softness=gpuArray(zeros(40,64));
crystallinity=gpuArray(zeros(132,64));
k=1;
l=1;
sz=512;
div=8;
a=3;
b=4;
for i=1:1:div
    for j=1:1:div
        f=(psi6_all(:,1)>=((i-1)*sz) & psi6_all(:,1)<(i*sz) & psi6_all(:,2)>=((j-1)*sz) & psi6_all(:,2)<(j*sz));
        A=psi6_all(f,:);
        A=gpuArray(A);
        for t=1:100:max(psi6_all(:,a))
            f1=(A(:,a)>=t & A(:,a)<t+100);
            psi6(k,l)=nanmean(A(f1,b));
            psi6_abs(k,l)=nanmean(abs(A(f1,6)));
            f2=(A(:,a)>=t & A(:,a)<t+100 & A(:,4)>0.7 & A(:,5)>3);
            crystallinity(k,l)=sum(f2)/sum(f1);
            k=k+1;
        end
        l=l+1;
        k=1;
    end
end
psi61=gather(psi6);
psi61=psi61(1:75,:);
tvec=(1:100:max(psi6_all(:,a)))';
psi61=horzcat(tvec,psi61);
psi6_abs1=gather(psi6_abs);
cryst=gather(crystallinity);
k=1;
l=1;
for i=1:1:div
    for j=1:1:div
        f=(req_coor(:,1)>=((i-1)*sz) & req_coor(:,1)<(i*sz) & req_coor(:,2)>=((j-1)*sz) & req_coor(:,2)<(j*sz));
        A=req_coor(f,:);
        A=gpuArray(A);
        for t=1:100:max(req_coor(:,3))
            f1=(A(:,a)>=t & A(:,a)<t+100);
            softness(k,l)=nanmean(A(f1,5));
            k=k+1;
        end
        l=l+1;
        k=1;
    end
end
softness1=gather(softness);
soft=[];
j=1;
for i=1:50:max(req_coor(:,3))
    f=req_coor(:,3)==i;
    soft(j)=mean(req_coor(f,5));
    j=j+1;
end
% windowSize = 20; 
% b = (1/windowSize)*ones(1,windowSize);
% a=1;
% M=filter(b,a,softness1,[],1);
% F=M(end,:)-M(1,:);
% f=F<-0.3;
% c=1:1:512;
% c=c.*f;
% c=nonzeros(c);