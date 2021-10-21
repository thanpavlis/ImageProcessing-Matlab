function [new] = erwthma3_a(image)
%pinakas gia kathe timh entashs apo min ews max
x(256)=0;
%pinakas p(r) me tis pithanothtes emfanishs
y(256)=0;
%pinakas t(r) isostathmishs istogrammatos
t(256)=0;
for i=0:255
     x(i+1) = i;
     y(i+1) = size(find(image==i),1)/(size(image,1)* size(image,2));
end
for i=0:255
   sum = 0;
   for j=0:i
        sum = sum + y(j+1);
   end
   t(i+1)=max(x)*sum;
end
new = image;
for i=1:size(new,1)
    for j=1:size(new,2)
        new(i,j) = t(find(x==image(i,j)));
    end
end
end