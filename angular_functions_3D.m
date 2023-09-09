% clearvars -except data
% f=data(:,5)<0.2;
% H1=data(f,[1 2 9]);
% % H1=data;
% profile on
% clearvars -except H1
load('E:\Devitrification\Sample5\Sample5_analysis\params_angular_functions.mat');
n=max(H(:,4));
k=120;
sigma=18.2;
angular_features=[];
for i=1:1:n
    tic
    f=(H(:,4)==i);
    A=H(f,:);
    [D,I]=pdist2(A(:,1:3),A(:,1:3),'euclidean','Smallest',k);
    f=(D<5*sigma);
    f=reshape(f,size(D));
    I=I.*f;
    clear D
    for j=1:1:length(A)
        %first indices of B is always X particle
        f=nonzeros(I(:,j));
        B=A(f,1:3); % B contains X,Y,Z of the particles
        D1=pdist2(B,B);
        D2=D1.*D1;
        D2=bsxfun(@plus,D2,D2(:,1)); % adding Rijs
        D2=bsxfun(@plus,D2,D2(1,:)); % adding Riks
        D3=-(D1.*D1);
        D4=bsxfun(@plus,D3,D2(:,1));
        D4=bsxfun(@plus,D4,D2(1,:));
        D4=D4/2;
        % D2 is now (Rij^2+Rik^2+Rjk^2)
        % D4 is now (Rij^2+Rik^2-Rjk^2) numerator of costijk
        D5=bsxfun(@ldivide,D1(:,1),D4);
        D5=bsxfun(@ldivide,D1(1,:),D5);
        % D5 contains costijk
        D2=D2(2:end,:);
        D2=D2(:,2:end);
        D5=D5(2:end,:);
        D5=D5(:,2:end);
        clear D3 D4
        parfor m=1:1:length(params(:,1))
            D11=exp(-(D2/((params(m,1)*sigma)^2)));
            D22=(1+params(m,3)*D5)^(params(m,2));
            % to remove only diagonal elements
            E=eye(size(D22));
            E=~E;
            D33=D11.*D22;
            D33=D33.*E;
            A1(j,3+m)=sum(sum(D33));
        end
    end
    angular_features=vertcat(angular_features,A1);
    toc
end
% profile viewer