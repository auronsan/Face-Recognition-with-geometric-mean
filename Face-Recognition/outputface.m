function varargout = outputface(varargin)
% OUTPUTFACE M-file for outputface.fig
%      OUTPUTFACE, by itself, creates a new OUTPUTFACE or raises the existing
%      singleton*.
%
%      H = OUTPUTFACE returns the handle to a new OUTPUTFACE or the handle to
%      the existing singleton*.
%
%      OUTPUTFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OUTPUTFACE.M with the given input arguments.
%
%      OUTPUTFACE('Property','Value',...) creates a new OUTPUTFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before outputface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to outputface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help outputface

% Last Modified by GUIDE v2.5 29-Mar-2015 21:56:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @outputface_OpeningFcn, ...
                   'gui_OutputFcn',  @outputface_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before outputface is made visible.
function outputface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to outputface (see VARARGIN)

% Choose default command line output for outputface
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
proyek = guidata(gcf);

set(proyek.figure1,'CurrentAxes',proyek.axes1)
bacground_axes = imread('bg_foto.jpg');
imshow(bacground_axes);
set(proyek.figure1,'CurrentAxes',proyek.axes2)
bacground_axes = imread('1st.jpg');
imshow(bacground_axes);
set(proyek.figure1,'CurrentAxes',proyek.axes3)
bacground_axes = imread('2nd.jpg');
imshow(bacground_axes);
set(proyek.figure1,'CurrentAxes',proyek.axes4)
bacground_axes = imread('3rd.jpg');
imshow(bacground_axes);
set(proyek.figure1,'CurrentAxes',proyek.axes5)
bacground_axes = imread('4th.jpg');
imshow(bacground_axes);
% UIWAIT makes outputface wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = outputface_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file path2]=uigetfile('D:/skripsi/data/uji2/ *.jpg;*.png;*.pgm','Select any image');
chosenfile=[path2 file];
file
J= imread(chosenfile);
proyek = guidata(gcbo);
origin=J;
save origin;
axes(proyek.axes1);
imshow(J, []);
hAx  = handles.axes1;
h= imrect(hAx,[10 10 205 205]);
position = wait(h);
pos=getPosition(h);
pos
save J;
save pos;
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load data;
load jarak_mata1_mata2;
load jarak_mata1_hidung;
load jarak_mata1_mulut;
load jarak_mata2_hidung;
load jarak_mata2_mulut;
load jarak_hidung_mulut;


a=jarak_mata1_mata2;
b=jarak_mata1_hidung;
c=jarak_mata1_mulut;
d=jarak_mata2_hidung;
e=jarak_mata2_mulut;
f=jarak_hidung_mulut;



[x y]=size(data);
temp = data;
for i=1:x
nama = temp{i,1}
g=temp{i,3};
h=temp{i,4};
j=temp{i,5};
k=temp{i,6};
l=temp{i,7};
m=temp{i,8};

% nilai1 = a/b/c/d/e/f;
% nilai2 = g/h/j/k/l/m;
nilai1 = nthroot(a.*b.*c.*d.*e.*f,6)%geometric means
nilai2 = nthroot(g.*h.*j.*k.*l.*m,6)

% nilai1 = nthroot(a.*c.*e,3)%geometric means
% nilai2 = nthroot(g.*j.*l,3)
%nilai1 =(g-a)^2+(h-b)^2+(j-c)^2+(k-d)^2+(l-e)^2+(m-f)^2; 
% end
% nilai1=sqrt((g-a)^2);
% nilai2=sqrt((h-b)^2);
% nilai3=sqrt((j-c)^2);%euclidean distance
% nilai4=sqrt((k-d)^2);
% nilai5=sqrt((l-e)^2);
% nilai6=sqrt((m-f)^2);

% nilai1=(g-a);
% nilai2=(h-b);
% nilai3=(j-c);
% nilai4=(k-d); mahatam
% nilai5=(e-l);
% nilai6=(f-m);
% 
% nilai1=[a;b;c;d;e;f];
% nilai2=[g;h;j;k;l;m];
% 
% nilai4=mahal(nilai2,nilai1);

nilai3 = (a/g+b/h+c/j+d/k+e/l+f/m)/6; %solving perbesaran / perkecilan


nilai1 = nilai1/nilai3;

nilai4 =abs(nilai1-nilai2);

temphasil{i,1}=i;
%temphasil(i,2)=abs(nilai1+nilai2+nilai3+nilai4+nilai5+nilai6);
temphasil{i,2}=nilai4;
temphasil{i,3}=temp{i,2};
end

% listing = dir(path);
% for x = 1:(size(listing,1)-2) % because listing(1) and listing(2) is the name of directory, not a file.
%     str namafile(x) = listing(x+2).name;
% end
% path='D:\skripsi\data\x512\';
% 
% 
% for x = 1:(size(listing,1)-2) % because listing(1) and listing(2) is the name of directory, not a file.
%     namafile = listing(x+2).name
% end

path='D:\skripsi\data\referensi\';


temphasil=sortrows(temphasil,2)
namafile=temp{temphasil{1,1},1};
nama=temp{temphasil{1,1},2};
chosenfile = [path namafile];
proyek = guidata(gcbo);
axes(proyek.axes2);
e=imread(chosenfile);
imshow(e);
set(proyek.text4,'String',num2str(temphasil{1,2}));
set(proyek.text14,'String',nama);

namafile=temp{temphasil{2,1},1};
nama=temp{temphasil{2,1},2};
chosenfile = [path namafile];
proyek = guidata(gcbo);
axes(proyek.axes3);
e=imread(chosenfile);
imshow(e);
set(proyek.text5,'String',num2str(temphasil{2,2}));
set(proyek.text15,'String',nama);


namafile=temp{temphasil{3,1},1};
nama=temp{temphasil{3,1},2};
chosenfile = [path namafile];
proyek = guidata(gcbo);
axes(proyek.axes4);
e=imread(chosenfile);
imshow(e);
set(proyek.text6,'String',num2str(temphasil{3,2}));
set(proyek.text16,'String',nama);

namafile=temp{temphasil{4,1},1};
nama=temp{temphasil{4,1},2};
chosenfile = [path namafile];
proyek = guidata(gcbo);
axes(proyek.axes5);
e=imread(chosenfile);
imshow(e);
set(proyek.text7,'String',num2str(temphasil{4,2}));
set(proyek.text17,'String',nama);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load pos;
load J;
pos
J=imcrop(J,pos);
%J=imresize(J,[120 120]);
axes(handles.axes1);
imshow(J);
%save J;
c=rgb2gray(J);
%c=edge(c,'prewitt',0.03','vertical');
c=edge(c,'sobel');
axes(handles.axes1);
imshow(c);
[baris kolom]=size(c)
% eye1=imrect(hAx,[0,0,60,45]);
% eye2=imrect(hAx,[60,0,60,45]);
% nose=imrect(hAx,[0,45,120,40]);
% mouth=imrect(hAx,[0,85,120,35]);
eye1=imrect(hAx,[0,0,floor(kolom/2),floor(baris/4+baris/8)]);
eye2=imrect(hAx,[floor(kolom/2),0,floor(kolom/2),floor(baris/4+baris/8)]);
nose=imrect(hAx,[0,floor(baris/4+baris/8),kolom,floor(baris/3)]);
mouth=imrect(hAx,[0,floor(baris/4+baris/8+baris/3),kolom,floor(baris-(baris/4+baris/8+baris/3))]);
temp3=0;
temp4=0;
save eye1;
save eye2;
save nose;
save mouth;
save c
% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load eye1
load eye2
load nose
load mouth
load c;
hAx  = handles.axes1;
[baris1 kolom1]=size(c);
%mulai pemotongan bagian
pos=getPosition(eye1); 
kolom2min=pos(1);
baris2min=pos(2);
panjang=pos(3);
lebar=pos(4);
for i=baris2min+1:lebar+baris2min
    for j=kolom2min+1:panjang+kolom2min
    d(i,j)=c(i,j); %potong per bagian
    end
end
axes(handles.axes2);
imshow(d);
[baris kolom]=find(d==1); %mencari nilai 1 per bagian
barismin=min(baris)
barismax=max(baris)
kolommin=min(kolom)
kolommax=max(kolom)


eye1=imrect(hAx,[kolommin-1,barismin-1,kolommax-kolommin+1,barismax-barismin+1]); %mengkerucutkan kotak

pos=getPosition(eye2)

kolom2min=pos(1);
baris2min=pos(2);
panjang=pos(3);
lebar=pos(4);
for i=baris2min+1:lebar+baris2min
    for j=kolom2min+1:panjang+kolom2min-1
    e(i,j)=c(i,j);
    end
end
axes(handles.axes3);
imshow(e);
[baris kolom]=find(e==1);
barismin=min(baris)
barismax=max(baris)
kolommin=min(kolom)
kolommax=max(kolom)


eye2=imrect(hAx,[kolommin-1,barismin-1,kolommax-kolommin+1,barismax-barismin+1]);

pos=getPosition(nose)
kolom2min=pos(1);
baris2min=pos(2);
panjang=pos(3);
lebar=pos(4);

for i=baris2min+1:lebar+baris2min
    for j=kolom2min+1:panjang+kolom2min
    f(i,j)=c(i,j);
    end
end
axes(handles.axes4);
imshow(f);
[baris kolom]=find(f==1);
barismin=min(baris)
barismax=max(baris)
kolommin=min(kolom)
kolommax=max(kolom)


nose=imrect(hAx,[kolommin-1,barismin-1,kolommax-kolommin+1,barismax-barismin+1]);

pos=getPosition(mouth)
kolom2min=pos(1);
baris2min=pos(2);
panjang=pos(3);
lebar=pos(4);
for i=baris2min+1:lebar+baris2min
    for j=kolom2min+1:panjang+kolom2min
    g(i,j)=c(i,j);
    end
end
axes(handles.axes5);
imshow(g);
[baris kolom]=find(g==1);
barismin=min(baris)
barismax=max(baris)
kolommin=min(kolom)
kolommax=max(kolom)


mouth=imrect(hAx,[kolommin-1,barismin-1,kolommax-kolommin+1,barismax-barismin+1]); %pemotongan bagian selesai

%mulai pengoptimalan bentuk setiap bagian

%eye1
pos=getPosition(eye1)
kolom2min=pos(1);
baris2min=pos(2);
panjang=pos(3);
lebar=pos(4);

[baris kolom]=find(d==1);
baris3=size(baris);
temp5=0;
x=2;
y=1;
status=0;
for i=baris2min+1:lebar+baris2min+1
for orde=1:baris3(1)
    if baris(orde)==i
    temp5(y,x)=kolom(orde);
    temp5(y,1)=i;
    x=x+1;
    status=1;
    end
    if status==1&&orde==baris3(1)
    y=y+1;
    end
    
    end
status=0;
x=2;
end

[baris4 kolom4]=size(temp5);
temp5(~temp5)=NaN;

for i=1:baris4
smin=min(temp5(i,2:kolom4));
smax=max(temp5(i,2:kolom4));
for j=smin:smax
d(temp5(i,1),j)=1;
c(temp5(i,1),j)=1;
end
end
axes(handles.axes2);
imshow(d);

%eye2
pos=getPosition(eye2)
kolom2min=pos(1);
baris2min=pos(2);
panjang=pos(3);
lebar=pos(4);

[baris kolom]=find(e==1);
baris3=size(baris);
temp5=0;
x=2;
y=1;
status=0;
for i=baris2min+1:lebar+baris2min+1
for orde=1:baris3(1)
    if baris(orde)==i
    temp5(y,x)=kolom(orde);
    temp5(y,1)=i;
    x=x+1;
    status=1;
    end
    if status==1&&orde==baris3(1)
    y=y+1;
    end
    
    end
status=0;
x=2;
end

[baris4 kolom4]=size(temp5);
temp5(~temp5)=NaN;

for i=1:baris4
smin=min(temp5(i,2:kolom4));
smax=max(temp5(i,2:kolom4));
for j=smin:smax
e(temp5(i,1),j)=1;
c(temp5(i,1),j)=1;
end
end
axes(handles.axes3);
imshow(e);

%nose
pos=getPosition(nose)
kolom2min=pos(1);
baris2min=pos(2)
panjang=pos(3);
lebar=pos(4)

[baris kolom]=find(f==1);
baris3=size(baris);
temp5=0;
x=2;
y=1;
status=0;
for i=baris2min+1:lebar+baris2min+1
for orde=1:baris3(1)
    if baris(orde)==i
    temp5(y,x)=kolom(orde);
    temp5(y,1)=i;
    x=x+1;
    status=1;
    end
    if status==1&&orde==baris3(1)
    y=y+1;
    end
    
    end
status=0;
x=2;
end

[baris4 kolom4]=size(temp5);
temp5(~temp5)=NaN;

for i=1:baris4
smin=min(temp5(i,2:kolom4));
smax=max(temp5(i,2:kolom4));
for j=smin:smax
f(temp5(i,1),j)=1;
c(temp5(i,1),j)=1;
end
end
axes(handles.axes4);
imshow(f);

%mouth
pos=getPosition(mouth)
kolom2min=pos(1);
baris2min=pos(2);
panjang=pos(3);
lebar=pos(4);

[baris kolom]=find(g==1);
baris3=size(baris);
temp5=0;
x=2;
y=1;
status=0;
for i=baris2min+1:lebar+baris2min+1
for orde=1:baris3(1)
    if baris(orde)==i
    temp5(y,x)=kolom(orde);
    temp5(y,1)=i;
    x=x+1;
    status=1;
    end
    if status==1&&orde==baris3(1)
    y=y+1;
    end
    
    end
status=0;
x=2;
end

[baris4 kolom4]=size(temp5);
temp5(~temp5)=NaN;

for i=1:baris4
smin=min(temp5(i,2:kolom4));
smax=max(temp5(i,2:kolom4));
for j=smin:smax
g(temp5(i,1),j)=1;
c(temp5(i,1),j)=1;
end
end
axes(handles.axes5);
imshow(g);

%morfologi closing
se=strel('disk',2);
c=imclose(c,se);
se=strel('disk',1);
c=imopen(c,se);
axes(handles.axes1);
imshow(J);

%eye1 centroid

d=double(d);
s= regionprops(d, 'centroid');
centroids = cat(1, s.Centroid);
hold on
plot(centroids(:,1), centroids(:,2), 'b*')
titik_tengah_mata1=centroids;
%eye2

e=double(e);
s= regionprops(e, 'centroid');
centroids = cat(1, s.Centroid);
hold on
plot(centroids(:,1), centroids(:,2), 'b*')
titik_tengah_mata2=centroids;

%nose

f=double(f);
s= regionprops(f, 'centroid');
centroids = cat(1, s.Centroid);
hold on
plot(centroids(:,1), centroids(:,2), 'b*')
titik_tengah_hidung=centroids

%mouth
g=double(g);
s = regionprops(g, 'centroid');
centroids = cat(1, s.Centroid);
hold on
plot(centroids(:,1), centroids(:,2), 'b*')
titik_tengah_mulut=centroids

jarak_mata1_mata2=norm(titik_tengah_mata1 - titik_tengah_mata2);
jarak_mata1_hidung=norm(titik_tengah_mata1 - titik_tengah_hidung);
jarak_mata1_mulut=norm(titik_tengah_mata1 - titik_tengah_mulut);
jarak_mata2_hidung=norm(titik_tengah_mata2 - titik_tengah_hidung);
jarak_mata2_mulut=norm(titik_tengah_mata2 - titik_tengah_mulut);
jarak_hidung_mulut=norm(titik_tengah_hidung - titik_tengah_mulut);


save jarak_mata1_mata2;
save jarak_mata1_hidung;
save jarak_mata1_mulut;
save jarak_mata2_hidung;
save jarak_mata2_mulut;
save jarak_hidung_mulut;

proyek = guidata(gcbo);
set(proyek.edit1,'String',num2str(jarak_mata1_mata2));
set(proyek.edit2,'String',num2str(jarak_mata1_hidung));
set(proyek.edit3,'String',num2str(jarak_mata1_mulut));
set(proyek.edit4,'String',num2str(jarak_mata2_hidung));
set(proyek.edit5,'String',num2str(jarak_mata2_mulut));
set(proyek.edit6,'String',num2str(jarak_hidung_mulut));



%pembenteukan setiap garis
line = guidata(gcbo);
position=[titik_tengah_mata1(1) titik_tengah_mata1(2); titik_tengah_mata2(1) titik_tengah_mata2(2)];
h = imline(line.axes1,position);


position=[titik_tengah_mata1(1) titik_tengah_mata1(2); titik_tengah_hidung(1) titik_tengah_hidung(2)];
h = imline(line.axes1,position);


position=[titik_tengah_mata1(1) titik_tengah_mata1(2); titik_tengah_mulut(1) titik_tengah_mulut(2)];
h = imline(line.axes1,position);



position=[titik_tengah_mata2(1) titik_tengah_mata2(2); titik_tengah_hidung(1) titik_tengah_hidung(2)];
h = imline(line.axes1,position);


position=[titik_tengah_mata2(1) titik_tengah_mata2(2); titik_tengah_mulut(1) titik_tengah_mulut(2)];
h = imline(line.axes1,position);


position=[titik_tengah_hidung(1) titik_tengah_hidung(2); titik_tengah_mulut(1) titik_tengah_mulut(2)];
h = imline(line.axes1,position);



hold off

save c;


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load c
imwrite(c,'data/tes2.jpg');

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load eye2nose
proyek = guidata(gcbo);
pos = eye2nose.getPosition();
point1 =[pos(1,1) pos(1,2)];
point2 =[pos(2,1) pos(2,2)];
range = norm(point1 - point2)
set(proyek.edit3,'String',num2str(range));
rangeeye2nose=range;
save rangeeye2nose;


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
line = guidata(gcbo);
nosemouth=imline(line.axes1);
save nosemouth;

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load nosemouth
proyek = guidata(gcbo);
pos = nosemouth.getPosition();
point1 =[pos(1,1) pos(1,2)];
point2 =[pos(2,1) pos(2,2)];
range = norm(point1 - point2)
set(proyek.edit4,'String',num2str(range));
rangenosemouth=range;
save rangenosemouth;


function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load J
load pos
crop = guidata(gcbo)
J=imcrop(J,pos);
axes(handles.axes1);
imshow(J);
hAx  = handles.axes1;
h= imrect(hAx,[0 0 50 50]);
position = wait(h);
pos=getPosition(h);
pos
save J;
c=J;
save c;
save pos;



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


