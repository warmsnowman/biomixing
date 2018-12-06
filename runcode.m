%I write this code in order to use parfor. That is, one can use the
%simulationr directly.
clear
global l Beta  U
l=1;
Beta=0.5;
U=1;
k=[1,2, 0.00001];%type of flow
L=20;%the length of swimmer moved at once.
M=40;%how many period you want
% dis=zeros(M,2,);
N1=20;

disp50=zeros(M,k(2),4000);
for i=1:200
dis=simulationr(N1,M,L,k);

disp50(:,:,(i-1)*N1+1:i*N1)=dis;

end

% % dis1=disp50;
% % dis=disp50;
% % disp50=dis;
% % save disp3c2_20.mat disp50
% %  system('shutdown /s')
% % dis1=dis;
% temp=size(dis,3);
% for i=1:size(dis1,3)
%    dis(:,:,temp+i)=dis1(:,:,i);
% end

% 
% temp=zeros(size(dis,2),size(dis,1),size(dis,3));
% for i=1:size(dis,3) 
%    temp(:,:,i)=dis(:,:,i)';    
% end
% tp=reshape(temp,size(temp,1),size(temp,2)*size(temp,3))';
% % %%
%     [f,xi]=hist(abs((tp(:,1))),0:0.15:4);
% f=f/2;
% f(1)=f(1)*2;
%  semilogy(xi, f/length(tp(:,1))/(xi(2)-xi(1)));
%  
%  tp1=tp;
%  tp=[tp;tp1];
%  
%  save simul.mat tp
%%
% N=10000;
%   phi=rand(1,N)*2*pi;%horizontal plane
%             %theta=rand(1,N)*pi;
%             theta=randmy(1,N,3);%vertical sin
%             A=[cos(phi).*sin(theta);sin(phi).*sin(theta);cos(theta)];%x unite vector in the comove frame
% 
% x=A(1,:);y=A(2,:);z=A(3,:);
% scatter3(x,y,z,'.')
% axis equal
%%
% save dispt_2.mat disp50
% save disp.mat p
% mailTome('simulation over','see attachment','dis.mat')
% system('shutdown /s')


% d=zeros(size(dis,2),size(dis,1),size(dis,3));
% for i=1:size(d,3)
% d(:,:,i)=dis(:,:,i)';
% end
% d=reshape(d,size(dis,2),size(dis,1)*size(dis,3))';



% % 
% % % 
% % %%
