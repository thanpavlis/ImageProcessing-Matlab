function new_im = erwthma1(im,dmin,dmax)
   imin = min(im(:));
   imax = max(im(:));
   w1 = (dmax-dmin)/(imax-imin);
   w2 = dmin - w1*imin;   
   new_im = round(w1*im+w2);
   figure(1);
   imshow(uint8(im));
   figure(2);
   imshow(uint8(new_im));
end