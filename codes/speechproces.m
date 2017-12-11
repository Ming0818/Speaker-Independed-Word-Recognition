%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NUREFÞAN SERTBAÞ,Mart2015
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
 %1 frame oluþturuldu
indis=indis-frameuzunlugu/2;
end


%dizi vektör formuna çevrildi,her satýr 1 frame e ait frame sayýsý kadar satýr var
counter=1;
for j=1:2*Fs/frameuzunlugu-1 %frame sayýsý kadar
    for i=1:frameuzunlugu
        yeni2(j,i)=yeni(counter);
        counter=counter+1;
    end    
end

% subplot(212);plot(yeni2);

% f= block(y,100,50);
% subplot(313);plot(f); 

%WÝNDOWÝNG
%N frameuzunlugu;
for n=0:N-1
w(n+1)=0.54-0.46*cos((2*pi*n)/(N-1));
end

%j satýr
%i sutun var

for m=1:j %her satýr için yani her frame i tek tek al
    tmp=yeni2(m,:);
    A=max(tmp);
    tmpwindowed=w.*tmp(1:N);
    windowed(m,:)=A*tmpwindowed;   
 end

% subplot(311);
% plot(y);title('orjinal');
% subplot(312);
% plot(yeni2);title('framelere ayrýlmýþ');
% subplot(313);
% plot(windowed);title('pencerelenmis')

% %FFT
% for m=1:j %her satýr için yani her frame i tek tek al
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

%%%deneme baslangýc
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

ak=ak(4:20); %17 katsayý!!
 
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
 alfa = (Amax-Amin)/L; %adým boyu
 uzunluk = Amin:alfa:Amax; %kuantalama seviyesi Amin den baþlayýp alfa aralýklarla Amax a kadar devam eder.
 yuvarlama = Amin-(alfa/2):alfa:Amax+(alfa/2); %lpc katsayýlarýnýn yuvarlama iþlemleri gerçekleþtirilir
 [ind,q] = quantiz(ak,uzunluk,yuvarlama); %kuantalama iþlemi

result=q;                                             

end

