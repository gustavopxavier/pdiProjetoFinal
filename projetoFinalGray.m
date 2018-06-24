pkg load image

clear all
close all

im = imread('/home/gustavo/Documentos/TADS/PDI/projetoFinal/imagens/1_2.jpeg');
figure('Name','Imagem original: Cebolinha')
imshow(im)

%figure('Name','Histograma Cebolinha Colorida');
%imhist(im)

cebolinhaGray = rgb2gray(im);

figure('Name','Imagem Cebolinha - Escala de cinzas');
imshow(cebolinhaGray);

figure('Name','Histograma Cebolinha - Escala de Cinzas');
imhist(cebolinhaGray)

imLimiar = cebolinhaGray;

for i=1:size(cebolinhaGray,1)
  for j=1:size(cebolinhaGray,2)
    if((cebolinhaGray(i,j)>120)&&(cebolinhaGray(i,j)<150));
      cebolinhaBW(i,j) = 255;
    else
      cebolinhaBW(i,j) = 0;
    end
  end
end 
    
figure('Name','Cebolinha BW'); 
imshow(cebolinhaBW)