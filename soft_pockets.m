res=zeros(15,3);
for i=1:1:15
    if i==1
        x1=121; y1=3257; x2=497; y2=3773;
    elseif i==2
         x1=964; y1=3507; x2=1622; y2=4201;
    elseif i==3   
         x1=2025; y1=3468; x2=2375; y2=3955;
    elseif i==4    
         x1=3496; y1=3323; x2=3955; y2=3685;
    elseif i==5    
         x1=1372; y1=2988; x2=1819; y2=3254;
    elseif i==6    
         x1=2262; y1=3026; x2=2553; y2=3360;
    elseif i==7    
         x1=1495; y1=2494; x2=1973; y2=3010;
    elseif i==8    
         x1=1927; y1=2536; x2=2134; y2=2916;
    elseif i==9   
         x1=2548; y1=2212; x2=3125; y2=2837;
    elseif i==10    
         x1=957; y1=1839; x2=1534; y2=2709;
    elseif i==11    
         x1=664; y1=1630; x2=1029; y2=2411;
    elseif i==12    
         x1=1106; y1=825; x2=1300; y2=1505;
    elseif i==13    
         x1=3045; y1=656; x2=3350; y2=1306;
    elseif i==14   
         x1=3877; y1=968; x2=4178; y2=1624;
    elseif i==15   
         x1=3820; y1=164; x2=4200; y2=895;
    end
    f=(soft(:,6)>=x1 & soft(:,7)>=y1 & soft(:,6)<=x2 & soft(:,7)<=y2);
    soft1=soft(f,:);
    res(i,1)=i;
    f1=unique(soft1(:,[3 5]),'rows');
    Lia=ismember(soft(:,[3,5]),f1,'rows');
    soft2=soft(Lia,:);
    soft2=sortrows(soft2,3);
    ff=accumarray(soft2(:,3),soft2(:,4),[],@mean);
    f1=nonzeros(ff);
    res(i,2)=mean(f1);
    f1=f1-mean(f1);
    f1=abs(f1);
    res(i,3)=mean(f1);
    res(i,4)=length(f1);
end
