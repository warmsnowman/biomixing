
re=zeros(1,201);
re(1)=1;
for k=1:100

for i=0:k
re(2*k)=re(2*k)+nchoosek(2*k,i)*2*(k-i);
end
re(2*k)=re(2*k)/2^(2*k);

for i=0:k
re(2*k+1)=re(2*k+1)+nchoosek(2*k+1,i)*(2*(k-i)+1);
end
re(2*k+1)=re(2*k+1)/2^(2*k+1);
end
re=re'*2
%%
x=1:201;
plot(x,re)
hold on 
plot(x,0.798877567852533*sqrt(x),'r');
hold off
%%

H=randmy(1,100000,2);

 [f,xi]=hist(H,0:0.1:2*pi);
plot(xi,f/100000/(xi(2)-xi(1)),'b'); 

hold on
y=1/2/pi+cos(2*xi)/3/pi;
plot(xi,y)
hold off

% polar(xi,f)

%%
N=4000;
square=zeros(N,50);
squarex=square;
squarey=square;
for j=1:N
%  theta=randmy(1,50,4);
theta=rand(1,50)*2*pi;
a1=[cos(theta);sin(theta)];
dis=zeros(2,50);
dis(:,1)=a1(:,1);
for i=2:50
    dis(:,i)=dis(:,i-1)+a1(:,i);    
    
end

squarex(j,:)=abs(dis(1,:)).^2;
squarey(j,:)=abs(dis(2,:)).^2;
end
square=squarex+squarey;
ms=mean(square,1)';
plot(ms)
a=polyfit(1:length(ms),ms',1);
xi=0:0.1:50;
yi=polyval(a,xi);
hold on
plot(xi,yi,'r')
hold off




