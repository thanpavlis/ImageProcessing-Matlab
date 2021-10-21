function [im] = ask2_erwthma3_2(image)
image=double(image);
figure(1);
imshow(uint8(image));
laplace=[0 1 0;1 -4 1;0 1 0];
%laplace=[1 1 1;1 -8 1;1 1 1];
image_new = conv2(image,laplace,'same');
im=zeros(size(image_new));
for i=1:size(image_new,1)
    for j=1:size(image_new,2)
        im(i,j)=image(i,j)-image_new(i,j);
    end
end
figure(2);
imshow(uint8(im));
end