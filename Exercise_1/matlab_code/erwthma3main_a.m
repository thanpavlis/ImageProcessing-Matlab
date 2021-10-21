museum=imread('museum.jpg');
museum=double(museum);
new_museum=zeros(size(museum));
new_museum(:,:,1)=erwthma3_a(museum(:,:,1));
new_museum(:,:,2)=erwthma3_a(museum(:,:,2));
new_museum(:,:,3)=erwthma3_a(museum(:,:,3));
figure(1);
imshow(uint8(museum));
figure(2);
imshow(uint8(new_museum));


dscn1078=imread('dscn1078.jpg');
dscn1078=double(dscn1078);
new_dscn1078=zeros(size(dscn1078));
new_dscn1078(:,:,1)=erwthma3_a(dscn1078(:,:,1));
new_dscn1078(:,:,2)=erwthma3_a(dscn1078(:,:,2));
new_dscn1078(:,:,3)=erwthma3_a(dscn1078(:,:,3));
figure(3);
imshow(uint8(dscn1078));
figure(4);
imshow(uint8(new_dscn1078));