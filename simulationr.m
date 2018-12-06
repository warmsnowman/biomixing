function [dis sdis]= simulationr(N1,M,L,k)
%for the reslut independent on U, we set U=1 in this code.
%this code is design for simulate one particle impacted by multiple
%swimmers.
%M how many period you want
%N1 how many particle you want. This accout should be better the multiple
%of the cpu core of your PC.
%the output dis has the size M*2*N1
%k(1) type of flow
kt=k(1);
dt=0.01;
%k(2) dimension
global l Beta
%the length of box [0,R]*[0,R]
Rb=1000;%the length of box [0,R]*[0,R]
n=k(3);%density of swimmers
N=floor(Rb^2*n);%number of swimmers

options = odeset('RelTol',1e-10);
swimmer_pos=rand(k(2),N)*Rb;%initial position of swimmers

%make sure the position of particle is outside of swimmers' body
particle_pos=zeros(k(2),N1);
for i=1:N1
    
    while 0==0
        radd=rand(k(2),1)*Rb;
        switch   k(2)
            case 2
                temp=bsxfun(@minus,swimmer_pos,radd);
                if sum(temp(1,:).^2+temp(2,:).^2<=1)==0
                    particle_pos(:,i)=radd;%initial position of particle
                    break
                    
                end
            case 3
                temp=bsxfun(@minus,swimmer_pos,radd);
                if sum(temp(1,:).^2+temp(2,:).^2+temp(3,:).^2<=1)==0
                    particle_pos(:,i)=radd;%initial position of particle
                    break
                end
                
        end
        
        
    end
    
end

dis=zeros(M,k(2),N1);% use dis(M,3) when you simulate the 3D case.
dis=zeros(M*(L/dt+1),k(2));
for i=1:M
    switch k(2)
        case 2
            
%             theta=rand(1,N)*2*pi;
%               theta=binornd(1,0.5,1,N)*pi;
              theta=randmy(1,N,2); 
%                theta=zeros(1,N);
            swimmer_dir=[cos(theta);sin(theta)];%x unite vector in the comove frame
            
         
        case 3
            phi=rand(1,N)*2*pi;%horizontal plane
            theta=randmy(1,N,3);%vertical sin
            swimmer_dir=[cos(phi).*sin(theta);sin(phi).*sin(theta);cos(theta)];%x unite vector in the comove frame
    end
    

    for j=1:N1% loop for each particle
        temp=particle_pos(:,j);%the position of j-th particle
        [~,Xs]=ode45(@(t,y)velo_sum(t,y,swimmer_dir,swimmer_pos,kt,l,Beta),0:dt:L,temp,options);
        dis([(i-1)*(L*100+1)+1:i*(L*100+1)],:,j)=Xs;
%        dis(i,:,j)=Xs(end,:)-temp';%the displacement position of j-th particle
%                  dis(i,:,j)=Xs(end,:);%just record the position of particle
        % dis(:,j)=Xs(end,:)-temp';%just record the position of particle
if particle_pos(:,j)~=mod(Xs(end,:)',Rb)
  char('out') 
    
end
        particle_pos(:,j)=mod(Xs(end,:)',Rb); %make sure the swimmers and particle are contain in the box

    end
     swimmer_pos=mod(swimmer_pos+L*swimmer_dir,Rb);
     
end


end

