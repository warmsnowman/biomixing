function [dx,dy]=velos(x,y,l,Beta)
r=sqrt(y.^2+x.^2);
dx=-l^2*(l^2*Beta*(-6*x.^3+9*x.*y.^2)+(3*x*Beta-2*l).*(2*x.^4+x.^2.*y.^2-y.^4))/4./r.^7;
dy=-3*l^2*y.*(-2*l*r.^2.*x+l^2*Beta*(-4*x.^2+y.^2)+Beta*(2*x.^4+x.^2.*y.^2-y.^4))/4./r.^7;
end
