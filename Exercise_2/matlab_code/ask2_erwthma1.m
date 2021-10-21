function [] = ask2_erwthma1(im)
   new=log(abs(im)+1);
   new_im=erwthma1(new,0,255);
   figure(1);
   imshow(im);
   figure(2);
   new_im=fftshift(new_im);
   imshow(uint8(new_im));
   start_image=erwthma1(ifft2(im),0,255);
   figure(3);
   imshow(uint8(start_image));
end