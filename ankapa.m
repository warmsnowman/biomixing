clear adddis squaredisx squaredisy
dis=disp50;
adddis=zeros(size(dis));
adddis(1,:,:)=dis(1,:,:);     
for i=2:size(dis,1) 
for k=1:size(dis,3)
    adddis(i,:,k)=adddis(i-1,:,k)+dis(i,:,k);               
end
end

% plot(adddis(:,1,2),adddis(:,2,2))
%%
%%%%square
squaredis=zeros(size(dis,1),size(dis,3));
squaredisx=zeros(size(dis,1),size(dis,3));
squaredisy=zeros(size(dis,1),size(dis,3));
for i=1:size(dis,1) 
for k=1:size(dis,3)
   squaredisx(i,k)=adddis(i,1,k)^2;
   squaredisy(i,k)=adddis(i,2,k)^2; 
end
end
% 
% 
% squaredis=squaredisx+squaredisy;
% squaredisx=squaredisx(:,9000:30000);
msx=mean(squaredisx,2);
msy=mean(squaredisy,2);
plot(msx)
hold on 
plot(msy,'r')
ms=msx+msy;
plot(ms)


% msx=msx*0.9;
% msy=msy*1.5;


a=polyfit(1:length(msx),msx',1)
% xi=0:0.1:40;
% yi=polyval(a,xi);
% 
% plot(xi,yi,'r')
hold off
% % 
% % 
% % 
% %%
% clear temp
% temp(:,:)=adddis(:,2,:);
% ms=mean(temp.^2,2);
% plot(ms)
% msa=ms/ms(1);
% a=polyfit(1:length(ms),ms',1);
% xi=0:0.1:50;
% yi=polyval(a,xi);
% hold on
% plot(xi,yi,'r')
% hold off

