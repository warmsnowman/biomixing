clear
global U l Beta
U=1;
l=1;
Beta=0.5;
R=30;
n=100;%density of particle
N=floor(R^2*pi*n)


%simulating the even distribution case
tic
theta=rand(1,N)*2*pi;
r=R*sqrt(rand(1,N));
% aleven=rand(1,N)*2*pi;
% al=binornd(1,0.5,1,N)*pi;
al=randmy(1,N,2);

b=(r.*cos(theta-al))';
a=(r.*sin(theta-al))';
[dx,dy]=swimmer_dispMVt(b,a,20,2);
toc
dx=dx';
dy=dy';
d=dx.*cos(al)-dy.*sin(al);%x component in the standar coordinate frame


load laughter
sound(y,Fs)

%%data saving 
save('data.mat','R','N','theta','r','al','dx','dy','d')
save('data_d.mat','R','N','d')




% system('shutdown /s')
rR=R;
rN=N;
rtheta=theta;
rr=r;
ral=al;
rdx=dx;
rdy=dy;
rd=d;
% 
% 
N=rN+N;
theta=[theta rtheta];
r=[r rr];
al=[al ral];
dx=[dx rdx];
dy=[dy rdy];
d=[d rd];




% 
% 
% 
% 
% [f,xi]=hist(kkk,0:0.05:2*pi);
% plot(xi,log(f/N/(xi(2)-xi(1))),'b'); 
% plot(xi,(f/N/(xi(2)-xi(1))),'b'); 
% hold on

