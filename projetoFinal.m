pkg load image

clear all
close all

im = imread('/home/gustavo/Documentos/TADS/PDI/projetoFinal/imagens/1_1.jpeg');
figure('Name','Imagem original: Cebolinha')
imshow(im)

%figure('Name','Histograma Cebolinha Colorida');
%imhist(im)

%f = rgb2gray(im);

%figure('Name','Imagem Cebolinha - Escala de cinzas');
%imshow(f);

%figure('Name','Histograma Cebolinha - Escala de Cinzas');
%imhist(f)

r(:,:) = im(:,:,1);
g(:,:) = im(:,:,2);
b(:,:) = im(:,:,3);

%figure('Name','Histograma Camada R');
%imhist(r)

%figure('Name','Histograma Camada G');
%imhist(g)

%figure('Name','Histograma Camada B');
%imhist(b)

cebolinha = uint8(zeros(size(im,1), size(im,2), size(im,3)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%%%%%%%%%%%%%%%%%%% CEBOLINHA - LIMIARIZAÇÃO %%%%%%%%%%%%%%%%%%%%%

for i=1:size(im,1)
  for j=1:size(im,2)
    if((r(i,j)<150)&&(g(i,j)<150)&&(b(i,j)>130))
      %cebolinha(i,j,:) = im(i,j,:);
      cebolinha(i,j,:) = 255;
    else
      %cebolinha(i,j,:) = 1;
      cebolinha(i,j,:) = im(i,j,:);
    end
  end
end

figure('Name','Cebolinha');
imshow(cebolinha);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%%%%%%%%%%%%%%%%%%% CEBOLINHA - BINARIZAÇÃO %%%%%%%%%%%%%%%%%%%%%

cebolinhaGray = rgb2gray(cebolinha);

figure('Name','Histograma Cebolinha Gray');
imhist(cebolinhaGray);

figure('Name','Histograma Cebolinha Gray');
imshow(cebolinhaGray);

for i=1:size(cebolinhaGray,1)
  for j=1:size(cebolinhaGray,2)
    if((cebolinhaGray(i,j)>50)&&(cebolinhaGray(i,j)<200));
      cebolinhaBW(i,j) = 0;
    else
      cebolinhaBW(i,j) = 255;
    end
  end
end 
    
figure('Name','Cebolinha BW'); 
imshow(cebolinhaBW);

cebolinhaBinaria = im2bw(cebolinhaBW);

figure('Name','Cebolinha Binária'); 
imshow(cebolinhaBinaria);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%%%%%%%%%%%%%%%%%%%%% CEBOLINHA - EROSÃO %%%%%%%%%%%%%%%%%%%%%%%%%%
A = cebolinhaBinaria;

% Considerando o elemento estruturante quadrado
B = [0 0 0; 0 0 0; 0 0 0];

Original = A;
C = A;
for k=1:1
  
for i=2:size(A,1)-1
  for j=2:size(A,2)-1
    if(A(i,j)==0) %se o pixel central da vizinhan�a de A = 1, deve ser analizado
      vizA = [A(i-1,j-1) A(i-1,j) A(i-1,j+1);...
            A(i,j-1) A(i,j) A(i,j+1);...
            A(i+1,j-1) A(i+1,j) A(i+1,j+1)];
      if (sum(sum(vizA==B))!=9) % se todos os pixels s�o iguais entre a vizinhan�a de A e B
        C(i,j)=0;
      end    
    end
  end
end
A = C;
end

figure('Name','Cebolinha Binária Erodida')
imshow(C)




















