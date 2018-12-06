function y=randmy(M,N,k)
%k==1   f(v)=(1+cos(2*s))/2/pi belong to  [0,2*pi] g(v)=1/2/pi C=2
%k==2   f(v)=(1+cos(s))/2/pi belong to  [0,2*pi] g(v)=1/2/pi C=2
%k==3   f(v)=sin(s)/2 belong to  [0,pi] g(v)=1/pi C=pi/2
%k==4   f(v)=(1+cos(16*s))/2/pi belong to  [0,pi] g(v)=1/pi C=pi/2
y=zeros(M,N);
switch k
    case 1
        for i=1:M
            for j=1:N
                while 0==0
                    u=rand*2*pi;
                    v=rand*2*pi;
                   if (1+cos(2*v))/2>u %change here if you want to change other PDF
                      y(i,j)=v;
                       break;
                   end
                   
                       %f(v)/c/g(v)>u
                end
            end
        end
            case 2
        for i=1:M
            for j=1:N
                while 0==0
                    u=rand*2*pi;
                    v=rand*2*pi;
                   if (3+2*cos(2*v))/5>u %change here if you want to change other PDF
                      y(i,j)=v;
                       break;
                   end
                   
                       %f(v)/c/g(v)>u
                end
            end
        end
                    case 3
        for i=1:M
            for j=1:N
                while 0==0
                    u=rand*pi;
                    v=rand*pi;
                   if sin(v)/2>u %change here if you want to change other PDF
                      y(i,j)=v;
                       break;
                   end
                   
                       %f(v)/c/g(v)>u
                end
            end
        end    
            case 4
        for i=1:M
            for j=1:N
                while 0==0
                    u=rand*2*pi;
                    v=rand*2*pi;
                   if cosa(v,16)>u %change here if you want to change other PDF
                      y(i,j)=v;
                       break;
                   end
                   
                       %f(v)/c/g(v)>u
                end
            end 
        end
end  

end     
        
        
function y=cosa(x,k)

if abs(x)<pi/2/k|| abs(x-pi)<pi/2/k|| x>2*pi-pi/2/k
 y=cos(k*x)*k/4;
%  y=cos(k*x)/0.24908832518177281247649072663727;
else 
y=0;
end


end

