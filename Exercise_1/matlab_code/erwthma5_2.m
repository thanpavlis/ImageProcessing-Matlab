function [] = erwthma5_2(name)
image=erwthma5_1(name);
image=uint8(image);
for i=1:size(image,1)
    for j=1:size(image,2)
        if(image(i,j)<100)
              image(i,j)=0;
        else
             image(i,j)=255;
        end
    end
end
figure(3);
imshow(uint8(image));
end

