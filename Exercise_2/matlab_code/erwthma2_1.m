function [] = erwthma2_1(image)
%pinakas gia kathe timh entashs apo min ews max
x(256)=0;
%pinakas p(r) me tis pathanothtes emfanishs
y(256)=0;
for i=0:255
     x(i+1) = i;
     y(i+1) = size(find(image==i),1)/(size(image,1)* size(image,2));
end
figure;
plot(x,y);
xlabel('H k-OSTH TIMH THS ENTASHS: rk');
ylabel('H PITHANOTHTA EMFANISHS ENOS EPIPEDOY ENTASHS rk: p(rk)');
title('ISTOGRAMMA THS EIKONAS');
end 
