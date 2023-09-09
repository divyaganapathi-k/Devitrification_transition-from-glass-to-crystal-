clearvars -except coor R
n=max(R(:,3));
H=drift_loop(R(:,[1 2 6 7]),20);
ti=10; %initial time (this will decide whether avalanche initiators or avalanche particles are identified)
deltat=8; % initial timescale to identify avalanche initiators
dia=10;
sigma=17.6;
A=circshift(H,-deltat);
B=A-H;
B(:,5)=((B(:,1).*B(:,1))+(B(:,2).*B(:,2))).^(0.5);
Data=[];
Data(:,1:4)=H(:,1:4);
Data(:,5)=B(:,4);
Data(:,6)=B(:,5);
Data(:,7)=B(:,5)/sigma;
Data(:,8:9)=R(:,1:2);
avalanche_initiators=[];
for i=1:1:n
    f= Data(:,3)==i;
    req_Data=Data(f,:);
    f1=find(req_Data(:,5)==0 & req_Data(:,7)>=0.33);
    req_Data1=req_Data(f1,:); %all particles with high displacements
    TRI=delaunay(req_Data1(:,1),req_Data1(:,2)); %nearest highly displaced particles
    figure
    scatter(req_Data1(:,1),req_Data1(:,2));
    hold on
    triplot(TRI,req_Data1(:,1),req_Data1(:,2));
    hold off
    DD=pdist(req_Data1(:,1:2));
    k=1;
    for j=1:length(req_Data1(:,1))
           f2=find(any(TRI==j,2));
           a=TRI(f2,:);
           b=find(unique(a)~=j);
           C=req_Data1(b,1:2); %#ok<*PFBNS>
           D=req_Data1(j,1:2);
           C(:,1)=C(:,1)-D(1,1);
           C(:,2)=C(:,2)-D(1,2);
           C(:,3)=(C(:,1).^2+C(:,2).^2).^(0.5);
           if any((C(:,3)<=2*sigma),2)
               coord(k,:)=req_Data1(j,1:2); %#ok<SAGROW>
               coord(k,3)=i;%#ok<SAGROW>
               coord(k,4:5)=req_Data1(j,8:9);%#ok<SAGROW>
               k=k+1;
           end
    end
           avalanche_initiators=vertcat(avalanche_initiators,coord);  %#ok<AGROW>
           coord=[];
end
for i=1:1:n
    A=imread(strcat('E:\Devitrification\Bandpass_data\phi3\Set10\',num2str(i ,'%04d'),'.tif'));
    imshow(A);
    hold on
    f=find(avalanche_initiators(:,3)==i);
    scatter(avalanche_initiators(f,1),avalanche_initiators(f,2));
    h=gcf;
    saveas(h,strcat('E:\Devitrification\Images\AI\Set1_average\',num2str(i),'.tif'));
end