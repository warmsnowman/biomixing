function [dx,dy]=velop(x,y,l)
r2=y.^2+x.^2;
dx=l^2*(x.^2-y.^2)./r2.^2;
dy=2*l^2*x.*y./r2.^2;

% dx=bsxfun(@times,l^2,(x.^2-y.^2)./r2.^2)
% dy=bsxfun(@times,2*l^2,x.*y./r2.^2)

end