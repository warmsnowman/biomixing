
function [Deltax, Deltay]=swimmer_dispMVt(bs,as,L,k)
global U l Beta
options = odeset('RelTol',1e-13);
Deltax=zeros(size(bs));
Deltay=zeros(size(bs));
tt=L/U;
M=size(bs,1);%raw
N=size(bs,2);%colum
parfor i=1:M
    for j=1:N
        pos=[bs(i,j);as(i,j)];
        if norm(pos)<=l
            Deltax(i,j)=0;
            Deltay(i,j)=0;
        else
            switch k
                case 1
                    [~,Xs]=ode45(@(t,y)velop(t,y,U,l),0:0.01:tt,pos,options);
                case 2
                    [~,Xs]=ode45(@(t,y)velos(t,y,U,l,Beta),0:0.01:tt,pos,options);
            end
            Deltax(i,j)=Xs(end,1)-pos(1);
            Deltay(i,j)=Xs(end,2)-pos(2);
        end
    end
end

end


function dy=velos(t,y,U,l,Beta)
dy=zeros(2,1);
xx=y(1)-U*t;
yy=y(2);
r=sqrt(yy^2+xx^2);
dy(1)=-U*l^2*(l^2*Beta*(-6*xx^3+9*xx*yy^2)+(3*xx*Beta-2*l)*(2*xx^4+xx^2*yy^2-yy^4))/4/r^7;
dy(2)=-3*l^2*U*yy*(-2*l*r^2*xx+l^2*Beta*(-4*xx^2+yy^2)+Beta*(2*xx^4+xx^2*yy^2-yy^4))/4/r^7;
end

function dy=velop(t,y,U,l)
dy=zeros(2,1);
xx=y(1)-U*t;
yy=y(2);

r=sqrt(yy^2+xx^2);


dy(1)=U*l^2*(xx^2-yy^2)/r^4;
dy(2)= 2*U*xx*yy*l^2/r^4;
end
