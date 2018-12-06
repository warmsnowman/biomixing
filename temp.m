Rb=2000;
dis=[[Rb/2+15,Rb/2];dis];
dis(end,:)=[];
%%

figure (1)
plot(dis(:,1),dis(:,2))
axis equal
figure (2)
plot(sdis(:,1),sdis(:,2))
axis equal


save trace.mat dis sdis