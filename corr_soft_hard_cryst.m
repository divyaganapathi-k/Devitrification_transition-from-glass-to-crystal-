f=soft(:,3)>000 & soft(:,3)<=2000;
soft1=soft(f,:);
f=hard(:,3)>000 & hard(:,3)<=2000;
hard1=hard(f,:);
% A1=randperm(length(soft1(:,1)),length(hard1(:,1)));
% soft1=soft1(A1,:);
% A1=randperm(length(req_part(:,1)),length(hard1(:,1)));
% req_part1=req_part(A1,:);% % soft1=soft;
% hard1=hard;
%  & psi6_count(:,3)<1200
% f=psi6_count(:,3)>12035  & psi6_count(:,4)>0.75 & psi6_count(:,7)>3 & psi6_count(:,5)>3;
% psi6=psi6_count(f,:);
% f=soft_particles_all(:,3)>000 & soft_particles_all(:,3)<=2000;
% soft1=soft_particles_all(f,:);
% f=hard_particles_all(:,3)>000 & hard_particles_all(:,3)<=2000;
% hard1=hard_particles_all(f,:);
% B=hist3(soft_particles_all1(:,5:6),'Edges',{190:38:3906 190:38:3906});
% B=B/max(max(B));
% C=hist3(hard_particles_all1(:,5:6),'Edges',{190:38:3906 190:38:3906});
% C=C/max(max(C));
b=18*4;
a1=190;
a2=394;
%(110 900)
% & psi6_count(:,3)<3235
% f=psi6_count(:,3)>0 & psi6_count(:,3)<26 & psi6_count(:,4)>0.75 & psi6_count(:,7)>3 & psi6_count(:,5)>3;
% psi6=psi6_count(f,:);
f=q61(:,4)>775 & q61(:,4)<785 & q61(:,3)>142 & q61(:,3)<153;
psi6=q61(f,:);
A=hist3(psi6(:,1:2),'Edges',{a1:b:a2 a1:b:a2});
A=A/max(max(A));
% f=A<100;
% A(f)=0;
% f=A>=100;
% A(f)=1;
% D=corr2(A,B);
% E=corr2(A,C);
B=hist3(soft1(:,1:2),'Edges',{a1:b:a2 a1:b:a2});
B=B/max(max(B));
% B=B*10;
% f=B<10;
% B(f)=0;
% f=B>=10;
% B(f)=1;
C=hist3(hard1(:,1:2),'Edges',{a1:b:a2 a1:b:a2});
C=C/max(max(C));
% C=C*10;
% f=C<10;
% C(f)=0;
% f=C>=10;
% C(f)=1;
% D=hist3(req_part1(:,5:6),'Edges',{a1:b:a2 a1:b:a2});
% D=D/max(max(D));
E=corr2(A,B);
F=corr2(A,C);
% G=corr2(A,D);
% C=[];
% j=1;
% for i=1:10:2000
%     f=soft1(:,3)>=i & soft1(:,3)<i+10;
%     C(:,:,j)=hist3(soft1(f,5:6),'Edges',{0:76:4300 0:76:4300});
%     j=j+1;
% end
% f=C<2;
% C(f)=0;
% f=C>=2;
% C(f)=1;
% D=[];
% for i=1:1:200
%     B=C(:,:,i);
%     D(:,:,i)=xor(B,A);
% end
% E=[];
% j=1;
% for i=1:10:2000
%     f=hard1(:,3)>=i & hard1(:,3)<i+10;
%     E(:,:,j)=hist3(hard1(f,5:6),'Edges',{0:38:4300 0:38:4300});
%     j=j+1;
% end
% f=E<2;
% E(f)=0;
% f=E>=2;
% E(f)=1;
% F=[];
% for i=1:1:200
%     B=E(:,:,i);
%     F(:,:,i)=xor(B,A);
% end
% f=soft_particles_all(:,3)<=2000;
% soft_particles_all1=soft_particles_all(f,:);
% f=hard_particles_all(:,3)<=2000;
% hard_particles_all1=hard_particles_all(f,:);
% C=[];
% j=1;
% for i=1:10:2000
%     f=soft_particles_all1(:,3)>=i & soft_particles_all1(:,3)<i+10;
%     C(:,:,j)=hist3(soft_particles_all1(f,5:6),'Edges',{0:38:4300 0:38:4300});
%     j=j+1;
% end
% f=C<5;
% C(f)=0;
% f=C>=5;
% C(f)=1;
% 
% 
% D=[];
% for i=1:1:200
%     B=C(:,:,i);
%     D(:,:,i)=xor(B,A);
% end
% 
% E=[];
% j=1;
% for i=1:10:2000
%     f=hard_particles_all1(:,3)>=i & hard_particles_all1(:,3)<i+10;
%     E(:,:,j)=hist3(hard_particles_all1(f,5:6),'Edges',{0:38:4300 0:38:4300});
%     j=j+1;
% end
% f=E<5;
% E(f)=0;
% f=E>=5;
% E(f)=1;
% 
% F=[];
% for i=1:1:200
%     B=E(:,:,i);
%     F(:,:,i)=xor(B,A);
% end
% req_part=[];
% for i=1:1:2000
%     f=req_coor(:,3)==i;
%     A=req_coor(f,:);
%     f=A(:,4)>0;
%     B=A(f,:);
%     B=sortrows(B,4);
%     B=B(1:400,:);
%     f=A(:,4)<0;
%     C=A(f,:);
%     C=sortrows(C,-4);
%     C=C(1:400,:);
%     req_part=vertcat(req_part,B);
%     req_part=vertcat(req_part,C);
% end
