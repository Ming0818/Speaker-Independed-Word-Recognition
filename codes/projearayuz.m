%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NUREFÞAN SERTBAÞ,Nisan2015
%%%%%%%%%%%%%%%%%%%%%%%%%%
function varargout = projearayuz(varargin)
% PROJEARAYUZ MATLAB code for projearayuz.fig
% Last Modified by GUIDE v2.5 24-Apr-2015 19:23:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @projearayuz_OpeningFcn, ...
                   'gui_OutputFcn',  @projearayuz_OutputFcn, ...
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


% --- Executes just before projearayuz is made visible.
function projearayuz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to projearayuz (see VARARGIN)

% Choose default command line output for projearayuz
handles.output = hObject;

% create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('arkaplan6.jpg'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');

set(handles.edit3,'String','***');

bg_image=imread('C:/Users/nurefsan/Documents/MATLAB/projedeneme/ok.png');
bg_image = imresize(bg_image,0.25);
set(handles.pb, 'CData', bg_image);


handles.I=imread('C:/Users/nurefsan/Documents/MATLAB/projedeneme/ftema1.jpg');
guidata(hObject,handles);
axes(handles.axesresim);
imshow(handles.I);

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes projearayuz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = projearayuz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pb_seskaydet.
function pb_seskaydet_Callback(hObject, eventdata, handles)
% hObject    handle to pb_seskaydet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fs=48000;
nbits=8;
filename='C:/Users/nurefsan/Documents/MATLAB/projedeneme/input.wav';
handles.myrecord = audiorecorder(fs,nbits,2);
set(handles.edit3,'String','Kayit basladi');
recordblocking(handles.myrecord,5); 
set(handles.edit3,'String','Kayýt sona erdi');
myRecorddata = getaudiodata(handles.myrecord);
wavwrite(myRecorddata, fs, nbits,filename);
fkesme(filename);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.a=get(handles.listbox1,'Value');
guidata(hObject,handles);

if handles.a==2
    set(handles.edit5,'String','Ýngilizce seçildi');
elseif handles.a==3
      set(handles.edit5,'String','Almanca seçildi');
elseif handles.a==4
      set(handles.edit5,'String','Fransýzca seçildi');
else
          set(handles.edit5,'String','Seçim yapýn');
end
guidata(hObject,handles);

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1



function txtkelime_Callback(hObject, eventdata, handles)
% hObject    handle to txtkelime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtkelime as text
%        str2double(get(hObject,'String')) returns contents of txtkelime as a double


% --- Executes during object creation, after setting all properties.
function txtkelime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtkelime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txttrkcekelime_Callback(hObject, eventdata, handles)
% hObject    handle to txttrkcekelime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txttrkcekelime as text
%        str2double(get(hObject,'String')) returns contents of txttrkcekelime as a double


% --- Executes during object creation, after setting all properties.
function txttrkcekelime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txttrkcekelime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pb.
function pb_Callback(hObject, eventdata, handles)
% hObject    handle to pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
secim=feslesme();

    if secim==1 %araba
        set(handles.txttrkcekelime,'String','Araba');
        filename='araba.jpg';
         switch handles.a
    case 2,   set(handles.txtkelime,'String','Car');
    case 3,   set(handles.txtkelime,'String','Auto');
    case 4,   set(handles.txtkelime,'String','Voiture');
        end
    end
    if secim==2 %armut
         set(handles.txttrkcekelime,'String','Armut');
          filename='armut.jpg';
        switch handles.a
    case 2,   set(handles.txtkelime,'String','Pears');
    case 3,   set(handles.txtkelime,'String','Birnen');
    case 4,   set(handles.txtkelime,'String','Poires');
        end
        
    end
    if secim==3 %çanta        
        set(handles.txttrkcekelime,'String','Çanta');
        filename='çanta.jpg';
        switch handles.a
    case 2,   set(handles.txtkelime,'String','Bag');
    case 3,   set(handles.txtkelime,'String','Tasche');
    case 4,   set(handles.txtkelime,'String','Sac');
        end
     end
    if secim==4  %deniz
         set(handles.txttrkcekelime,'String','Deniz');
        filename='deniz.jpg';

        switch handles.a
    case 2,   set(handles.txtkelime,'String','Sea');
    case 3,   set(handles.txtkelime,'String','Meer');
    case 4,   set(handles.txtkelime,'String','Mer');
        end
    end
    if secim==5 %elma
        set(handles.txttrkcekelime,'String','Elma');
        filename='elma.jpg';
        switch handles.a
    case 2,   set(handles.txtkelime,'String','Apple');
    case 3,   set(handles.txtkelime,'String','Apfel');
    case 4,   set(handles.txtkelime,'String','Pomme');
        end
    end
    if secim==6  %kablo
        set(handles.txttrkcekelime,'String','Kablo');
        filename='kablo.jpg';
        switch handles.a
    case 2,   set(handles.txtkelime,'String','Cable');
    case 3,   set(handles.txtkelime,'String','Kabel');
    case 4,   set(handles.txtkelime,'String','Câble');
        end
    end
    if secim==7  %kaþýk
        set(handles.txttrkcekelime,'String','Kaþýk');
        filename='kaþýk.jpg';
            switch handles.a
         case 2,   set(handles.txtkelime,'String','Spoon');
         case 3,   set(handles.txtkelime,'String','Löffel');
         case 4,   set(handles.txtkelime,'String','Cuillère');
            end
    end
    if secim==8  %köpek
         set(handles.txttrkcekelime,'String','Köpek');
        filename='köpek.jpg';
        switch handles.a
    case 2,   set(handles.txtkelime,'String','Dog');
    case 3,   set(handles.txtkelime,'String','Hund');
    case 4,   set(handles.txtkelime,'String','Chien');
        end
    end
    if secim==9 %mavi
        set(handles.txttrkcekelime,'String','Mavi');
        filename='mavi.jpg';
        switch handles.a
    case 2,   set(handles.txtkelime,'String','Blue');
    case 3,   set(handles.txtkelime,'String','Blau');
    case 4,   set(handles.txtkelime,'String','Bleu');
        end
    end
    if secim==10 %tamam
        set(handles.txttrkcekelime,'String','Tamam');
        filename='tamam.jpg';
        switch handles.a
    case 2,   set(handles.txtkelime,'String','OK');
    case 3,   set(handles.txtkelime,'String','OK');
    case 4,   set(handles.txtkelime,'String','OK');
        end
    end
    if secim==11%üzüm
        set(handles.txttrkcekelime,'String','Üzüm');
        filename='üzüm.jpg';
        
       
        switch handles.a
    case 2,    set(handles.txtkelime,'String','Grapes');
    case 3,    set(handles.txtkelime,'String','Trauben');
    case 4,    set(handles.txtkelime,'String','Raisin');
        end
     end
                  
handles.I=imread(filename);
guidata(hObject,handles);
axes(handles.axesresim);
imshow(handles.I);

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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[y,Fs] = wavread('C:/Users/nurefsan/Documents/MATLAB/projedeneme/input');
sound(y,Fs);
%pause(5);
set(handles.edit3,'String','Dil seçimi yapýn');



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


% --- Executes on selection change in kelimeler.
function kelimeler_Callback(hObject, eventdata, handles)
% hObject    handle to kelimeler (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns kelimeler contents as cell array
%        contents{get(hObject,'Value')} returns selected item from kelimeler


% --- Executes during object creation, after setting all properties.
function kelimeler_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kelimeler (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
