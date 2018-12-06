function du = velo_sum(t,particle_pos,swimmer_dir,swimmer_pos,k,l,Beta)

swimmer_pos=swimmer_pos+t*swimmer_dir;
s2p=bsxfun(@minus,particle_pos,swimmer_pos);%the vector from the swimmer to the particle
b=dot(swimmer_dir,s2p);%x component in the comove frame
temp=s2p-bsxfun(@times,swimmer_dir,b);
a=sqrt(sum(temp.^2,1));%y component in the comove frame
spy=bsxfun(@rdivide,temp,a);% y unite vector in the comove frame
    switch k
        case 1
[dx,dy]=velop(b,a,l);
        case 2
[dx,dy]=velos(b,a,l,Beta);
    end
    
du=sum(bsxfun(@times,dx,swimmer_dir)+bsxfun(@times,dy,spy),2);%the total vector field is the sum of each field.
end

