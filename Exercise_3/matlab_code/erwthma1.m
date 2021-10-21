function [] = erwthma1(img)
      pro=erwthma2_1(img);
      H=0;
      for i=1:256
          %an h pithanothta einai diaforh tou mhdenos
          if(pro(i)~=0)
              H=H+pro(i)*log2(pro(i));
          end
      end
      H=(-1)*H;
      %ipologismos tou lexikou kai ang_len=b=bits/pixel
      [dict,avg_len]=huffmandict((0:255),pro);
      %kwdikopoihsh ths eikonas se mia akolouthia
      enco=huffmanenco(img(:),dict);
      %arithmos bits ana pixel
      bits_ana_pixel=size(enco,1)/((size(img,1))*(size(img,2)));
      %logos simpieshs c=b'/b  b'=arithmos bits/pixel
      %anaparastash prin thn simpiesh kai b=arithmos bitspixel
      c=8/avg_len;
      %ipologismos tou pleonasmou ths simpieshs R=1-(1/c)
      r=1-(1/c);
      fprintf('Entropia: %f\n',H);
      fprintf('Bits ana pixel: %f\n',bits_ana_pixel);
      fprintf('Logos simpieshs: %f\n',c);
      fprintf('Pleonasmos arxikhs kwdikopoihshs: %f\n',r);
end