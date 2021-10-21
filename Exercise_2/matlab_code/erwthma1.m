function new_im = erwthma1(im,dmin,dmax)
   imin = min(im(:));
   imax = max(im(:));
   w1 = (dmax-dmin)/(imax-imin);
   w2 = dmin - w1*imin;   
   new_im = round(w1*im+w2);
end