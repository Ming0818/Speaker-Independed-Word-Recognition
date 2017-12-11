%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NUREFŞAN SERTBAŞ,Nisan2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function decision = feslesme()
filename='input.wav';
myquantvect=speechproces(filename);

N=54;
indis=0;
CompMatrix=dlmread('deneme.txt');
distancevect(11*N,1)=0;


for i=1:11*N
 distancevect(i,1)=pdist2( myquantvect,CompMatrix(i,:));
end


distancevect=transpose(distancevect);
disp(distancevect);
minimum=min(distancevect);

for i=1:11*N
    if distancevect(1,i)==minimum
    indis=i;
    end
end


    if indis>0 && indis<N+1 %araba
    disp('araba');
    decision=1;
    end
    if indis>N && indis<2*N %armut
        disp('armut');
            decision=2;
    end
    if indis>2*N && indis<3*N %çanta
         disp('çanta');
             decision=3;

     end
    if indis>3*N && indis<4*N %deniz
       disp('deniz');
           decision=4;

    end
    if indis>4*N && indis<5*N %elma
         disp('elma');
             decision=5;

    end
    if indis>5*N && indis<6*N %kablo
            disp('kablo');
                decision=6;
    end
    if indis>6*N && indis<7*N %kaşık
           disp('kaşık');  
               decision=7;

    end
    if indis>7*N && indis<8*N %köpek
            disp('köpek');  
                decision=8;

    end
    if indis>8*N && indis<9*N %mavi
             disp('mavi');
                 decision=9;

    end
    if indis>9*N && indis<10*N %tamam
               disp('tamam'); 
                   decision=10;

    end
    if indis>10*N && indis<11*N+1%üzüm
              disp('üzüm');
                  decision=11;

    end  
    
    disp(indis);
end
 
