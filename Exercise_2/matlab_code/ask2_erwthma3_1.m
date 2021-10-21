function [new] = ask2_erwthma3_1(im,f,n)
   fp=zeros(2*size(im,1),2*size(im,2));
   %eikona fp diastasewn 2m*2n
   for i=1:size(im,1)
      for j=1:size(im,2)
           fp(i,j)=im(i,j);
      end
   end
   %ipologismos tou estw g ginonenou ths fp me (-1)^(x+y)
   g=zeros(size(fp));
   for i=1:size(g,1)
      for j=1:size(g,2)
           g(i,j)=fp(i,j)*power(-1,(i+j));
      end
   end
   %ipologismos tou metasxhmatismou fourier ths g
   G=fft2(g);
   %dhmiourgia tou Butterworth Lowpass Filter
   %ipologismos tou D(u,v)
   D=zeros(size(fp));
   for i=1:size(D,1)
       for j=1:size(D,2)
          D(i,j)=power((power((i-size(D,1)/2),2)+power((j-size(D,2)/2),2)),1/2);
       end
   end
   %dhmiourgia ths H
   H=zeros(size(fp));
   for i=1:size(H,1)
       for j=1:size(H,2)
           H(i,j)=1/(1+power((D(i,j)/f),2*n));
       end
   end
   %ipologismos tou S pou einai iso me to ginomeno ths G me thn H logw tou
   %oti vriskomaste sto pedio twn sixnothtwn
   S=zeros(size(fp));
   for i=1:size(H,1)
       for j=1:size(H,2)
           S(i,j)=G(i,j)*H(i,j);
       end
   end
   %ipologismos tou s = ginomeno real(ifft2(S)) me to  (-1)^(x+y)
   s=real(ifft2(S));
   for i=1:size(H,1)
       for j=1:size(H,2)
           s(i,j)=s(i,j)*power(-1,i+j);
       end
   end
   %kratame to kommati pou antistoixei sthn MxN eikona dld twn arxikwn
   %diastasewn
   new=zeros(size(im));
   for i=1:size(im,1)
       for j=1:size(im,2)
           new(i,j)=s(i,j);
       end
   end
   figure(1);
   imshow(uint8(im));
   figure(2);
   imshow(uint8(new));
   figure(3);
   imshow(H);
end