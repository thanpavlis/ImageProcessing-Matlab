function [image_new] = erwthma5_1(name)
image=imread(strcat(name,'.jpg'));
image=rgb2gray(image);
image=double(image);
figure(1);
imshow(uint8(image));
sobelx=[-1 -2 -1;0 0 0;1 2 1];
sobely=sobelx';
imagex = conv2(image,sobelx,'same');
imagey = conv2(image,sobely,'same');
image_new=sqrt(power(imagex,2)+power(imagey,2));
figure(2);
imshow(uint8(image_new));
end