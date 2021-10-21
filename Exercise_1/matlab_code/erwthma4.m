function [] = erwthma4(image)
wall=imread(strcat(image,'.jpg'));
wall=double(wall);
pixels=impixel(uint8(wall));
main_point = [mean(pixels(:,1)) mean(pixels(:,2)) mean(pixels(:,3))];
for i=1:size(wall,1)
   for j=1:size(wall,2)
       sum=0;
       for k=1:size(wall,3)
            temp=power(wall(i,j,k)-main_point(k),2); 
            sum=sum+temp;
       end
       if(sum<power(50,2))
             wall(i,j,1)=255;
             wall(i,j,2)=255;
             wall(i,j,3)=0;
       end
   end
end
figure(2);
imshow(uint8(wall));
end

