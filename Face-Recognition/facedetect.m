function face_a=facedetect(i)
j=skin(i);
se = strel('disk',5);
se2 = strel('disk',3);
er = imerode(j,se2);
cl = imclose(er,se);
dil = imdilate(cl,se);        % morphologic dilation
dil = imdilate(dil,se); 
cl2 = imclose(dil,se);
d2 = imfill(cl2, 'holes');  
facearea = bwdist(~d2); 
face(:,:,1)=double(i(:,:,1)).*d2;   
face(:,:,2)=double(i(:,:,2)).*d2; 
face(:,:,3)=double(i(:,:,3)).*d2; 
face_a=uint8(face);