mus=imread('museum.jpg');
mus=double(mus);
mus_hsv=rgb2hsv(mus);
new_mus=zeros(size(mus_hsv));
new_mus(:,:,1)=mus_hsv(:,:,1);
new_mus(:,:,2)=mus_hsv(:,:,2);
new_mus(:,:,3)=erwthma3_a(mus_hsv(:,:,3));
new_mus=hsv2rgb(new_mus);
figure(1);
imshow(uint8(mus));
figure(2);
imshow(uint8(new_mus));

dscn=imread('dscn1078.jpg');
dscn=double(dscn);
dscn_hsv=rgb2hsv(dscn);
new_dscn=zeros(size(dscn_hsv));
new_dscn(:,:,1)=dscn_hsv(:,:,1);
new_dscn(:,:,2)=dscn_hsv(:,:,2);
new_dscn(:,:,3)=erwthma3_a(dscn_hsv(:,:,3));
new_dscn=hsv2rgb(new_dscn);
figure(3);
imshow(uint8(dscn));
figure(4);
imshow(uint8(new_dscn));