function [] = ask2_erwthma4_average(image,filter_size)
   filter=ones(filter_size);
   filter=filter/(filter_size*filter_size);
   figure(1);
   imshow(uint8(image));
   image_new = conv2(image,filter,'same');
   figure(2);
   imshow(uint8(image_new));
end

