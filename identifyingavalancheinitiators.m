clearvars -except coor R
n=max(R(:,3));
ti=100; %initial time (this will decide whether avalanche initiators or avalanche particles are identified)
deltat=10; % initial timescale to identify avalanche initiators
dia=10;
A=circshift(R,-deltat);
B=A-R;
B(:,8)=((B(:,1).*B(:,1))+(B(:,2).*B(:,2))).^(0.5);
Data=[];
Data(:,1:4)=R(:,[1 2 6 7]);
Data(:,5:7)=B(:,[6 7 8]);
Data(:,8)=Data(:,7)/dia;
avalanche_initiators=[];l
for i=1:1:n
    f= Data(:,3)==i;
    req_Data=Data(f,:);
    f=find(req_Data(:,6)==0 & req_Data(:,8)>=0.5);
    req_Data1=req_Data(f,:); %all particles with high displacements
    H=delaunay(req_Data1(:,1),req_Data1(:,2)); %nearest highly displaced particles
    k=1;
    for j=1:length(req_Data1(:,1))
           f=find(any(H==j,2));
           a=H(f,:);
           b=find(unique(a)~=j);
           C=A(b,1:2); %#ok<*PFBNS>
           D=A(j,1:2);
           C(:,1)=C(:,1)-D(1,1);
           C(:,2)=C(:,2)-D(1,2);
           C(:,3)=(C(:,1).^2+C(:,2).^2).^(0.5);
           if any(C(:,3)<=1.7*sigma,2)
               coord(k,:)=A(j,1:2); %#ok<SAGROW>
               coord(k,3)=i;%#ok<SAGROW>
               k=k+1;
           end
           avalanche_initiators=vertcat(avalanche_initiators,coord);
           coord=[];
    end
end