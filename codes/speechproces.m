%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NUREF�AN SERTBA�,Mart2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function result = speechproces(filename)
%filename='input.wav';
[y,Fs]=wavread(filename);%y sampled data,Fs sampling frequency

indis=1;i=1;
frameuzunlugu=500;
N=frameuzunlugu;
overlap=50; %50 overlap
% subplot(211);plot(y);
col=1;

for j=1:2*Fs/frameuzunlugu-1
for k=1:frameuzunlugu
    yeni(i)=y(indis); %yeni(i:frameuzunlugu+i)
    i=i+1;
   indis=indis+1;
end
 %1 frame olu�turuldu
indis=indis-frameuzunlugu/2;
end


%dizi vekt�r formuna �evrildi,her sat�r 1 frame e ait frame say�s� kadar sat�r var
counter=1;
for j=1:2*Fs/frameuzunlugu-1 %frame say�s� kadar
    for i=1:frameuzunlugu
        yeni2(j,i)=yeni(counter);
        counter=counter+1;
    end    
end

% subplot(212);plot(yeni2);

% f= block(y,100,50);
% subplot(313);plot(f); 

%W�NDOW�NG
%N frameuzunlugu;
for n=0:N-1
w(n+1)=0.54-0.46*cos((2*pi*n)/(N-1));
end

%j sat�r
%i sutun var

for m=1:j %her sat�r i�in yani her frame i tek tek al
    tmp=yeni2(m,:);
    A=max(tmp);
    tmpwindowed=w.*tmp(1:N);
    windowed(m,:)=A*tmpwindowed;   
 end

% subplot(311);
% plot(y);title('orjinal');
% subplot(312);
% plot(yeni2);title('framelere ayr�lm��');
% subplot(313);
% plot(windowed);title('pencerelenmis')

% %FFT
% for m=1:j %her sat�r i�in yani her frame i tek tek al
%     tmp=yeni2(m,:);
%     tmpfft=fft(tmp);
%     yfreq(m,:)=tmpfft;   
% end

%LPC
P=20;
% for m= 1:1
% frame = yeni2(80,:);
% r=autocorr(frame);
% R = toeplitz(r(1:P)) ;
% Y = -r(2:(P+1));
% ak=inv(R)*transpose(Y);
% yeni3(m,:)=ak;
% end

%%%deneme baslang�c
son=0;
for m= 1:2*Fs/frameuzunlugu-1
son=[son yeni2(m,:)];
end
r=autocorr(son);
disp(son);
R = toeplitz(r(1:P)) ;
Y = -r(2:(P+1));
ak=inv(R)*transpose(Y);
%%%%deneme bitis

ak=ak(4:20); %17 katsay�!!
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 L = 15; %kuanta seviyesi
 Amax =max(ak); 
 Amin=2;
 
 for i=1:17
     if Amin>ak(i)
         Amin=ak(i);
     end
 end
 
 %Amin = min(ak);
 alfa = (Amax-Amin)/L; %ad�m boyu
 uzunluk = Amin:alfa:Amax; %kuantalama seviyesi Amin den ba�lay�p alfa aral�klarla Amax a kadar devam eder.
 yuvarlama = Amin-(alfa/2):alfa:Amax+(alfa/2); %lpc katsay�lar�n�n yuvarlama i�lemleri ger�ekle�tirilir
 [ind,q] = quantiz(ak,uzunluk,yuvarlama); %kuantalama i�lemi

result=q;                                             

end

