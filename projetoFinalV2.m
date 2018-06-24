pkg load image

clear all
close all

im = imread('/home/gustavo/Documentos/TADS/PDI/projetoFinal/imagens/1_7.jpeg');
figure('Name','Imagem original: Cebolinha')
imshow(im)

r(:,:) = im(:,:,1);
g(:,:) = im(:,:,2);
b(:,:) = im(:,:,3);

%im = uint8(zeros(size(im,1), size(im,2), size(im,3)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%%%%%%%%%%%%%%%%%%% CEBOLINHA - LIMIARIZAÇÃO %%%%%%%%%%%%%%%%%%%%%
separaFundo = separaAzul(im);

figure('Name','Imagem Cebolinha - Sem fundo');
imshow(separaFundo);

figure('Name','Histograma Cebolinha sem fundo');
imhist(separaFundo)

cebolinhaGray = separaFundo;

figure('Name','Imagem Cebolinha - Escala de cinzas');
imshow(cebolinhaGray);

cebolinhaBW = uint8(zeros(size(im,1), size(im,2)));

for i=1:size(cebolinhaGray,1)
  for j=1:size(cebolinhaGray,2)
    if((cebolinhaGray(i,j)>0)&&(cebolinhaGray(i,j)<256));
      cebolinhaBW(i,j) = 255;
    else
      cebolinhaBW(i,j) = 0;
    end
  end
end 
    
figure('Name','Cebolinha BW'); 
imshow(cebolinhaBW)
