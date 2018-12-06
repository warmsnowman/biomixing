%for the reslut independent on U, we set U=1 in this code.
%remain for one step one step simulation
clear
global l Beta
l=1;
Beta=0.5;

Rb=300;%the length of box [0,R]*[0,R]
n=0.001;%density of swimmers
% N=floor(Rb^2*n);
N=1;
initial_pos=rand(2,1)*Rb;%initial position of particle
swimmer_pos=rand(2,N)*Rb;%initial position of swimmers
for i=1:1
theta=rand(1,N)*2*pi;
swimmer_dir=[cos(theta);sin(theta)];%x unite vector in the comove frame
s2p=bsxfun(@minus,initial_pos,swimmer_pos);%the vector from the swimmer to the particle
s2p=bsxfun(@rdivide,s2p,sqrt(sum(s2p.^2,1)));%unite vector, 

b=dot(swimmer_dir,s2p);%x component in the comove frame
temp=s2p-bsxfun(@times,swimmer_dir,b);
a=sqrt(sum(temp.^2,1));%y component in the comove frame
spy=bsxfun(@rdivide,temp,a);% y unite vector in the comove frame

% dot(swimmer_dir,s2p-swimmer_dir*dot(swimmer_dir,s2p))
% sum(swimmer_dir.*(s2p-swimmer_dir*dot(swimmer_dir,s2p)))
% % dot(swimmer_dir,s2p)-dot(swimmer_dir,swimmer_dir*dot(swimmer_dir,s2p))

[dx,dy]=velop_sum(b,a);
u=sum(bsxfun(@times,dx,swimmer_dir)+bsxfun(@times,dy,spy));



end




