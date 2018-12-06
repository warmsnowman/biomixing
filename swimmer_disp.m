function dx=swimmer_disp(b,a,L,k)
% [dx,theta]=swimmer_disp(b,a,L,k)
%when t=0 fish is at (0,0) particle (b,a)
%fish swim along the positive x-axes
%k(1)=1 potential 2D,2 strokes 3D
%when k(1)=2. beta=0. that is 3D potential flow.
%k(2)=0 no plot; 1 plot
%square dot is initial point, round dot is end point.
%I delete the variable t from this code, for the vector field in this case
%is autonomous system.
global U l Beta
pos=[b;a];
options = odeset('RelTol',1e-13);
%  options = odeset('RelTol',1e-10);
if norm(pos)<=l
    %   ['a=' num2str(a) ', b=' num2str(b) ': Particle Inside the Swimmer']
    dx=[0 0];
else
    switch k(1)
        case 1
            
            [~,Xs]=ode45(@velop,0:0.01:L/U,pos,options);
        case 2
            [~,Xs]=ode45(@velos,0:0.01:L/U,pos,options);
    end
    %     if nargin>2
    %         [ts,Xs]=ode23(@velos,[t:0.01:t+L/U],pos,options);
    if k(2)==1

        close all
  %  xrange=[min(Xs(:,1)) max(Xs(:,1))];
  %  yrange=[min(Xs(:,2)) max(Xs(:,2))];
    hold on;
    plot(pos(1),pos(2),'s','MarkerSize',8,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor','none');
    plot(Xs(end,1),Xs(end,2),'o','MarkerSize',8,'MarkerFaceColor',[0 0 1],'MarkerEdgeColor','none');
    plot(Xs(:,1),Xs(:,2),'k-','LineWidth',1.5);
%     set(gca, 'DataAspectRatio',[1 1 1]);
    title(['a=' num2str(a) ', b=' num2str(b) ', \lambda=' num2str(L) ', \Delta^2=' num2str(norm(Xs(end,:)-pos')^2)],'FontSize',15);
    axis equal
    end
    
    %     else
    %         [ts,Xs]=ode23(@velos,[t:0.01:t+L/U],pos,options);
    %     end
    dx=Xs(end,:)-pos';
%     theta=-atan2(dx(1),dx(2))+pi/2;
end
end



function dy=velos(t,y)
global U l Beta
dy=zeros(2,1);
xx=y(1)-U*t;
yy=y(2);
r=sqrt(yy^2+xx^2);
dy(1)=-U*l^2*(l^2*Beta*(-6*xx^3+9*xx*yy^2)+(3*xx*Beta-2*l)*(2*xx^4+xx^2*yy^2-yy^4))/4/r^7;
dy(2)=-3*l^2*U*yy*(-2*l*r^2*xx+l^2*Beta*(-4*xx^2+yy^2)+Beta*(2*xx^4+xx^2*yy^2-yy^4))/4/r^7;
end

function dy=velop(t,y)
global U l

dy=zeros(2,1);
xx=y(1)-U*t;
yy=y(2);

r=sqrt(yy^2+xx^2);


dy(1)=U*l^2*(xx^2-yy^2)/r^4;
dy(2)= 2*U*xx*yy*l^2/r^4;
end

