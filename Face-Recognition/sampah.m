% 
% path='D:\skripsi\data\x512\'
% listing = dir(path);
% 
% for x1 = 1:(size(listing,1)-2) % because listing(1) and listing(2) is the name of directory, not a file.
%     namafile = listing(x1+2).name;
%     K = imread([path namafile]);
%     K=rgb2gray(K);
% K=edge(K,'sobel');
% [baris kolom]=size(K);
% eye11=imcrop(K,[0,0,floor(kolom/2),floor(baris/4+baris/8)]);
% axes(proyek.axes2);
% imshow(eye11);
% eye21=imcrop(K,[floor(kolom/2),0,floor(kolom/2),floor(baris/4+baris/8)]);
% axes(proyek.axes3);
% imshow(eye21);
% nose11=imcrop(K,[0,floor(baris/4+baris/8),kolom,floor(baris/3)]);
% axes(proyek.axes4);
% imshow(nose11);
% mouth11=imcrop(K,[0,floor(baris/4+baris/8+baris/3),kolom,floor(baris-(baris/4+baris/8+baris/3))]);
% axes(proyek.axes5);
% imshow(mouth11);
% 
% %eye11
% kolom2min=0;
% baris2min=0;
% panjang=floor(kolom/2);
% lebar=floor(baris/4+baris/8);
% 
% [baris1 kolom1]=find(eye11==1);
% baris3=size(baris1);
% temp5=0;
% x=2;
% y=1;
% status=0;
% for i=baris2min+1:lebar+baris2min+1
% for orde=1:baris3(1)
%     if baris1(orde)==i
%     temp5(y,x)=kolom1(orde);
%     temp5(y,1)=i;
%     x=x+1;
%     status=1;
%     end
%     if status==1&&orde==baris3(1)
%     y=y+1;
%     end
%     
%     end
% status=0;
% x=2;
% end
% 
% [baris4 kolom4]=size(temp5);
% temp5(~temp5)=NaN;
% 
% for i=1:baris4
% smin=min(temp5(i,2:kolom4));
% smax=max(temp5(i,2:kolom4));
% for j=smin:smax
% eye11(temp5(i,1),j)=1;
% end
% end
% axes(handles.axes2);
% imshow(eye11);
% se=strel('disk',2);
% eye11=imclose(eye11,se);
% se=strel('disk',1);
% eye11=imopen(eye11,se);
% axes(handles.axes2);
% imshow(eye11);
% 
% 
% %eye21
% kolom2min=floor(kolom/2);
% baris2min=0;
% panjang=floor(kolom/2);
% lebar=floor(baris/4+baris/8);
% 
% [baris1 kolom1]=find(eye21==1);
% baris3=size(baris1);
% temp5=0;
% x=2;
% y=1;
% status=0;
% for i=baris2min+1:lebar+baris2min+1
% for orde=1:baris3(1)
%     if baris1(orde)==i
%     temp5(y,x)=kolom1(orde);
%     temp5(y,1)=i;
%     x=x+1;
%     status=1;
%     end
%     if status==1&&orde==baris3(1)
%     y=y+1;
%     end
%     
%     end
% status=0;
% x=2;
% end
% 
% [baris4 kolom4]=size(temp5);
% temp5(~temp5)=NaN;
% 
% for i=1:baris4
% smin=min(temp5(i,2:kolom4));
% smax=max(temp5(i,2:kolom4));
% for j=smin:smax
% eye21(temp5(i,1),j)=1;
% end
% end
% axes(handles.axes3);
% imshow(eye21);
% se=strel('disk',2);
% eye21=imclose(eye21,se);
% se=strel('disk',1);
% eye21=imopen(eye21,se);
% axes(handles.axes3);
% imshow(eye21);
% 
% %nose1
% [tes1 tes2]=size(nose11)
% kolom2min=0;
% baris2min=floor(baris/4+baris/8)
% panjang=kolom;
% lebar=floor(baris/3)
% 
% [baris1 kolom1]=find(nose11==1);
% baris3=size(baris1);
% temp5=0;
% x=2;
% y=1;
% status=0;
% for i=0:lebar+1
% for orde=1:baris3(1)
%     if baris1(orde)==i
%     temp5(y,x)=kolom1(orde);
%     temp5(y,1)=i;
%     x=x+1;
%     status=1;
%     end
%     if status==1&&orde==baris3(1)
%     y=y+1;
%     end
%     
%     end
% status=0;
% x=2;
% end
% 
% [baris4 kolom4]=size(temp5);
% temp5(~temp5)=NaN;
% temp5
% 
% % eye11
% eye11=double(eye11);
% s= regionprops(eye11, 'centroid');
% centroids = cat(1, s.Centroid);
% titik_tengah_mata1=centroids;
% 
% %eye21
% 
% eye21=double(eye21);
% s= regionprops(eye21, 'centroid');
% centroids = cat(1, s.Centroid);
% titik_tengah_mata2=centroids;
% %titik_tengah_mata2(2)=titik_tengah_mata2(2)+floor(kolom/2);
% g=norm(titik_tengah_mata1 - titik_tengah_mata2);
% 
% 
% % 
% % %nose
% % 
% % nose1=double(nose1);
% % s= regionprops(nose1, 'centroid');
% % centroids = cat(1, s.Centroid);
% % titik_tengah_hidung=centroids
% % 
% % %mouth
% % mouth1=double(mouth1);
% % s = regionprops(mouth1, 'centroid');
% % centroids = cat(1, s.Centroid);
% % titik_tengah_mulut=centroids
% % 
% % 
% % g=norm(titik_tengah_mata1 - titik_tengah_mata2);
% % h=norm(titik_tengah_mata1 - titik_tengah_hidung);
% % j=norm(titik_tengah_mata1 - titik_tengah_mulut);
% % k=norm(titik_tengah_mata2 - titik_tengah_hidung);
% % l=norm(titik_tengah_mata2 - titik_tengah_mulut);
% % m=norm(titik_tengah_hidung - titik_tengah_mulut);
% % 
% % nilai1 = nthroot(a.*b.*c.*d.*e.*f,6);%geometric means
% % nilai2 = nthroot(g.*h.*j.*k.*l.*m,6);
% % %nilai1 =(g-a)^2+(h-b)^2+(j-c)^2+(k-d)^2+(l-e)^2+(m-f)^2; 
% % nilai4 =abs(nilai1-nilai2);
% % temphasil(x,1)=x;
% % %temphasil(i,2)=abs(nilai1+nilai2+nilai3+nilai4+nilai5+nilai6);
% % temphasil(x,2)=nilai4;
% end
