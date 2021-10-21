function [F1,F2,F3,F4,F5,F6,F7,F8] = erwthma2(img,vima)
   img=double(img); 
   img=erwthma1_1(img,0,255);
   %------------------------------------------------------
   %METAVLHTES POY XREIAZONTAI GIA TON FFT METASXHMATISMO|
   %------------------------------------------------------
   %ipologismos metasxhmatismou fourier kai shiftarisma sto kentro
   img_four=fft2(img);
   %ipologismos metrwn apeikonishs ths  metasxhmatismou ths eikonas
   metra_four=abs(img_four);
   %epeidh exoume polles idies times kratame mono tis monadikes
   metra=unique(metra_four);
   %sortaroume to logar apo to megalitero sto mikrotero gia 
   %na krathsoume tis megaliteres times
   metra=sort(metra,'descend');
   %trexwn thesh tou pinaka metra
   j=1;
   %ipologismos tou trexontos posostou san arxikh timh einai to 0
   sum_pos=0;
   %------------------------------------------------------------------------------------------
   %METAVLHTES POY XREIAZONTAI GIA TON DCT METASXHMATISMO|
   %------------------------------------------------------
   %ipologismos metasxhmatismou fourier kai shiftarisma sto kentro
   img_dct=dct2(img);
   %ipologismos metrwn apeikonishs ths  metasxhmatismou ths eikonas
   metra_dct=abs(img_dct);
   %epeidh exoume polles idies times kratame mono tis monadikes
   metra2=unique(metra_dct);
   %sortaroume to logar apo to megalitero sto mikrotero gia 
   %na krathsoume tis megaliteres times
   metra2=sort(metra2,'descend');
   %trexwn thesh tou pinaka metra2
   k=1;
   %ipologismos tou trexontos posostou san arxikh timh einai to 0
   sum_pos2=0;
   %----------------------------------------------------------------------------------------------------  
   %ola ta pososta apo to 0 ews to 100 me to vima pou pairnoume san parametro
   pos=(0:vima:100);
   %pinakes gia na kratame to sfalma gia kathe pososto
   sfalma(size(pos,2))=0;
   sfalma2(size(pos,2))=0;
   %diadikasia pou ekteleitai gia kathe pososto
   for i=1:size(pos,2)
       %-----------------------------------------
       %DIADIKASIA IPOLOGISMOU TIMWN GIA TON FFT|
       %-----------------------------------------
       %thelw se kathe neo pososto na mhdenizw alles theseis tou pinaka
       %logar ara ton thelw apo thn arxh se kathe for
       temp=img_four;
       %thelw na krathsw to pos(i) pososto sthn eikona pou na apoteleitai
       %apo tis megaliteres times tou pinaka logar
       %telika kratame ton deikth j kai xeroume mexri poia thesh tou pinaka
       %tha krathsoume ta metra 
       while sum_pos < pos(i)           
           sum_pos=sum_pos+(size(find(metra_four==metra(j)),1)*100)/(size(metra_four,1)*size(metra_four,2));
           %if gia na mhn xeperasoume to pososto pou theloume na krathsoume
           if (j+1)<size(metra,1)
              %an den xeperasoume to orio pernoume kai thn epomenh timh 
              if (sum_pos+(size(find(metra_four==metra(j+1)),1)*100)/(size(metra_four,1)*size(metra_four,2)))<=pos(i)
                  j=j+1;
              else
                  %alliws stamatame thn while
                  sum_pos=pos(i);
              end
           end
       end
       %mhdenizw oles tis theseis tou pinaka temp pou einai mikrotera ths
       %theshs metra(j)
       temp(find(metra_four<metra(j)))=0;
       %anakatskeuh eikonas me antistrofo metasxhmatismo fourier
       anakatask=ifft2(temp);
       %gia to parapanw pososto thelw thn logarithmikh apeionish ths temp
       metasx=log(abs(temp)+1);
       metasx=erwthma1_1(metasx,0,255);
       metasx=(fftshift(metasx));
       %ipologismos ths eikonas sfalmatos apo thn arxikh afairw thn
       %anakataskevasmenh gia trexwn pososto
       eikona_sfalmatos=abs(img-anakatask);
       
       %ipologismos mesou apolitou sfalmatos exontas to metro ths diaforas ths arxikhs
       %eikonas me thn anakataskeuasmenh kanoume sum ta stoixeia auta kai
       %diairoume me to plithos twn pixels
       meso_apol_sfalma=sum(eikona_sfalmatos(:))/(size(img,1)*size(img,2));
       %-------------------------------------------------------------------------------------------------------------
       %DIADIKASIA IPOLOGISMWN GIA TON DCT|
       %-----------------------------------
       %thelw se kathe neo pososto na mhdenizw alles theseis tou pinaka
       %logar ara ton thelw apo thn arxh se kathe for
       temp2=img_dct;
       %thelw na krathsw to pos(i) pososto sthn eikona pou na apoteleitai
       %apo tis megaliteres times tou pinaka logar
       %telika kratame ton deikth j kai xeroume mexri poia thesh tou pinaka
       %tha krathsoume ta metra 
       while sum_pos2 < pos(i)           
           sum_pos2=sum_pos2+(size(find(metra_dct==metra2(k)),1)*100)/(size(metra_dct,1)*size(metra_dct,2));
           %if gia na mhn xeperasoume to pososto pou theloume na krathsoume
           if (k+1)<size(metra2,1)
              %an den xeperasoume to orio pernoume kai thn epomenh timh 
              if (sum_pos2+(size(find(metra_dct==metra2(k+1)),1)*100)/(size(metra_dct,1)*size(metra_dct,2)))<=pos(i)
                  k=k+1;
              else
                  %alliws stamatame thn while
                  sum_pos2=pos(i);
              end
           end
       end
       %mhdenizw oles tis theseis tou pinaka temp pou einai mikrotera ths
       %theshs metra(j)
       temp2(find(metra_dct<metra2(k)))=0;
       %anakatskeuh eikonas me antistrofo metasxhmatismo fourier
       anakatask2=idct2(temp2);
       %gia to parapanw pososto thelw thn logarithmikh apeionish ths temp
       metasx2=log(abs(temp2)+1);
       metasx2=erwthma1_1(metasx2,0,255);
       %ipologismos ths eikonas sfalmatos apo thn arxikh afairw thn
       %anakataskevasmenh gia trexwn pososto
       eikona_sfalmatos2=abs(img-anakatask2);
       
       %ipologismos mesou apolitou sfalmatos exontas to metro ths diaforas ths arxikhs
       %eikonas me thn anakataskeuasmenh kanoume sum ta stoixeia auta kai
       %diairoume me to plithos twn pixels
       meso_apol_sfalma2=sum(eikona_sfalmatos2(:))/(size(img,1)*size(img,2));
       %-----------------------------------------------------------------------------------------------------------------
       sfalma(i)=meso_apol_sfalma;
       sfalma2(i)=meso_apol_sfalma2;
       %-----------------------------------------------------------------------------------------------------------------
       %APEIKONISH TOY FRAME|
       %---------------------
       %APEIKONISH AUTWN POY AFOROUN TON FFT
       %apeikonish metasxhmatismou
       subplot(2,4,1),subimage(uint8(metasx));
       F1(i)=getframe;
       %apeikonish anakataskeuasmenhs eikonas
       subplot(2,4,2),subimage(uint8(anakatask));
       F2(i)=getframe;
       %apeikonish eikonas sfalmatos
       subplot(2,4,3),subimage(uint8(eikona_sfalmatos));
       F3(i)=getframe;
       %apeikonish mesou apolitou sfalmatos
       subplot(2,4,4),plot(pos,sfalma);
       F4(i)=getframe;
       %------------------------------------------------
       %APEIKONISH AUTWN POY AFOROUN TON DCT
       %apeikonish metasxhmatismou
       subplot(2,4,5),subimage(uint8(metasx2));
       F5(i)=getframe;
       %apeikonish anakataskeuasmenhs eikonas
       subplot(2,4,6),subimage(uint8(anakatask2));
       F6(i)=getframe;
       %apeikonish eikonas sfalmatos
       subplot(2,4,7),subimage(uint8(eikona_sfalmatos2));
       F7(i)=getframe;
       %apeikonish mesou apolitou sfalmatos
       subplot(2,4,8),plot(pos,sfalma2);
       F8(i)=getframe;
   end
   figure;plot(pos,sfalma,pos,sfalma2);
   title('MESO APOLITO SFALMA SYNARTHSEI TOY POSOSTOY');
   xlabel('Pososto');
   ylabel('Meso apolito sfalma');
   legend('FFT','DCT');
end