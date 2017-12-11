%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NUREFÞAN SERTBAÞ,Nisan2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function cutted = fkesme( filename )

[y,Fs]=wavread(filename);%y sampled data,Fs sampling frequency
N = length(y);
t = linspace(0, N/Fs, N);
%     subplot(211);
  %  plot(t,y);xlabel('zaman(s)');ylabel('genlik');


%eðer baþta gürültü/boþluk varsa
counter=0;
for i=1:length(y)
    if abs(y(i))~=0
        counter=counter+1;
    end
    if counter==9600
       break;
    end
end

if counter~=0
ynew=y(i-0.3*Fs:(i+0.7*Fs)); 
end
   wavwrite(ynew,Fs,filename);
      N = length(ynew);
     t = linspace(0, N/Fs, N);
%      subplot(212);
%      plot(t,ynew);xlabel('zaman(s)');ylabel('genlik');
   
end

