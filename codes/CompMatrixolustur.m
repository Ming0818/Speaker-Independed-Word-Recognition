%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NUREF�AN SERTBA�,Nisan2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function result= CompMatrixolustur()

N=54;%ki�i say�s�
result(N,17)=0;
j=0;

for i=1:11*N
    if i>0 && i<N+1 %araba
    j=j+1;
    filename = sprintf('%s%d','araba',j);
    filename=strcat(filename,'.wav');
    result(i,:)=speechproces(filename);
     if j==N 
        j=0; end
    end
    if i>N && i<2*N %armut
           j=j+1;
    filename = sprintf('%s%d','armut',j);
    filename=strcat(filename,'.wav');
    result(i,:)=speechproces(filename);
     if j==N 
        j=0; end
    end
    if i>2*N && i<3*N %�anta
           j=j+1;
    filename = sprintf('%s%d','�anta',j);
    filename=strcat(filename,'.wav');
    result(i,:)=speechproces(filename);
   if j==N 
        j=0; end
    end
    if i>3*N && i<4*N %deniz
           j=j+1;
    filename = sprintf('%s%d','deniz',j);
    filename=strcat(filename,'.wav');
    result(i,:)=speechproces(filename);
     if j==N 
        j=0; end
    end
    if i>4*N && i<5*N %elma
           j=j+1;
    filename = sprintf('%s%d','elma',j);
    filename=strcat(filename,'.wav');
    result(i,:)=speechproces(filename);
     if j==N 
        j=0; end
    end
    if i>5*N && i<6*N %kablo
           j=j+1;
    filename = sprintf('%s%d','kablo',j);
    filename=strcat(filename,'.wav');
    result(i,:)=speechproces(filename);
    if j==N 
        j=0; end
    end
    if i>6*N && i<7*N %ka��k
           j=j+1;
    filename = sprintf('%s%d','ka��k',j);
    filename=strcat(filename,'.wav');
    result(i,:)=speechproces(filename);
     if j==N 
        j=0; end
    end
    if i>7*N && i<8*N %k�pek
             j=j+1;
    filename = sprintf('%s%d','k�pek',j);
    filename=strcat(filename,'.wav');
    result(i,:)=speechproces(filename);
    if j==N 
        j=0; end
    end
    if i>8*N && i<9*N %mavi
             j=j+1;
    filename = sprintf('%s%d','mavi',j);
    filename=strcat(filename,'.wav');
    result(i,:)=speechproces(filename);
    if j==N 
        j=0; end
    end
    if i>9*N && i<10*N %tamam
             j=j+1;
    filename = sprintf('%s%d','tamam',j);
    filename=strcat(filename,'.wav');
    result(i,:)=speechproces(filename);
    if j==N 
        j=0; end
    end
    if i>10*N && i<11*N+1%�z�m
             j=j+1;
    filename = sprintf('%s%d','�z�m',j);
    filename=strcat(filename,'.wav');
    result(i,:)=speechproces(filename);
    if j==N 
        j=0; end
    end    
 end

I= fopen('deneme.txt','w');
mysize = fprintf(I,'%5f %5f %5f %5f %5f %5f %5f %5f %5f %5f %5f %5f %5f %5f %5f %5f %5f\n',result')
end

