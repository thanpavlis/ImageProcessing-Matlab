function [image] = ask2_erwthma4(image)
y=zeros(size(image));
for i=1:size(y,1)
    for j=1:size(y,2)
       y(i,j)=rand();
    end
end
figure(1);
imshow(uint8(image));
for i=1:size(y,1)
    for j=1:size(y,2)
       if(y(i,j)<0.1)
           image(i,j)=0;
       elseif(y(i,j)>0.9)
           image(i,j)=255;
       end
    end
end
figure(2);
imshow(uint8(image));
end