function [] = ask2_erwthma4_median(im)
   new_im=zeros(size(im));
   for i=2:(size(im,1)-1)
       for j=2:(size(im,2)-1)
           temp=[im(i-1,j-1) im(i-1,j) im(i-1,j+1);im(i,j-1) im(i,j) im(i,j+1);im(i+1,j-1) im(i+1,j) im(i+1,j+1)];
           temp=sort(temp(:));
           new_im(i,j)=temp(5);
       end
   end 
   figure(1);
   imshow(uint8(im));
   figure(2);
   imshow(uint8(new_im));
end

