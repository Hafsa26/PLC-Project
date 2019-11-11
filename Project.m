clear all;
close all;
clc

A = imread('IK1.jpg');  
B = imread('IK2.jpg');
C = imread('NS1.jpg');
D = imread('NS2.jpg');
imshow(A);
imshow(B);
imshow(C);
imshow(D);
size (A)
size (B)
size (C)
size (D)

A = rgb2gray(imread('IK1.jpg'));  
B = rgb2gray(imread('IK2.jpg'));
C = rgb2gray(imread('NS1.jpg'));
D = rgb2gray(imread('NS2.jpg'));
imshow(A);
imshow(B);
imshow(C);
imshow(D);
size (A)
size (B)
size (C)
size (D)

% To convert the picture into matrix form 
A = double(rgb2gray(imread('IK1.jpg')));  
B = double(rgb2gray(imread('IK2.jpg')));
C = double(rgb2gray(imread('NS1.jpg')));
D = double(rgb2gray(imread('NS2.jpg')));
imshow(A);
pcolor(flipud(A)), shading interp, colormap(gray)

imshow(B);
pcolor(flipud(B)), shading interp, colormap(gray)

%imshow(C);
pcolor(flipud(C)), shading interp, colormap(gray)

%imshow(D);
pcolor(flipud(D)), shading interp, colormap(gray)
break
A = imresize(double(rgb2gray(imread('IK1.jpg'))),[60 40]);  
B = imresize(double(rgb2gray(imread('IK2.jpg'))),[60 40]);
C = imresize(double(rgb2gray(imread('NS1.jpg'))),[60 40]);
D = imresize(double(rgb2gray(imread('NS2.jpg'))),[60 40]);
subplot(2,2,1),pcolor(flipud(A)), shading interp, colormap(gray),set(gca, 'Xtick',[],'Ytick',[]);
subplot(2,2,2),pcolor(flipud(B)), shading interp, colormap(gray),set(gca, 'Xtick',[],'Ytick',[]);
subplot(2,2,3),pcolor(flipud(C)), shading interp, colormap(gray),set(gca, 'Xtick',[],'Ytick',[]);
subplot(2,2,4),pcolor(flipud(D)), shading interp, colormap(gray),set(gca, 'Xtick',[],'Ytick',[]);
% Average Face
AvgIK = (A+B)/2;
AvgNS = (C+D)/2;
% Figure 2 
subplot(2,2,1),pcolor(flipud(AvgIK)), shading interp, colormap(gray),set(gca, 'Xtick',[],'Ytick',[]);
subplot(2,2,2),pcolor(flipud(AvgNS)), shading interp, colormap(gray),set(gca, 'Xtick',[],'Ytick',[]);
% Data Matrix
M = [reshape(A,1,60*40) reshape(B,1,60*40) reshape(C,1,60*40) reshape(D,1,60*40)];
E = (M')* (M);
size(E)
[G,M] = eigs(E,20,'lm');

% Figure 3
%subplot(2,3,1),face1=reshape(G(:,1),60,40); pcolor(flipud(face1)), shading interp, colormap(gray),set(gca, 'Xtick',[],'Ytick',[]);
%subplot(2,3,2),face1=reshape(G(:,2),60,40); pcolor(flipud(face1)), shading interp, colormap(gray),set(gca, 'Xtick',[],'Ytick',[]); 

subplot(2,3,3), semilogy(diag(M)),'ko'; 'Linewidth';
set(gca);

%Figure 4
vecIK = reshape(AvgIK,1,60*40);
vecNS = reshape(AvgNS,1,60*40);

projIK=vecIK*G;
projNS=vecNS*G;


projIK=vecIK*G;
projNS=vecNS*G;
subplot(2,2,1), bar(projIK(2:20)),set(gca,'Xlim',[0 20],'Ylim',[-2000,2000],'Xtick',[],'Ytick',[]);
text(12,-1700,'IK')
subplot(2,2,2), bar(projNs(2:20)),set(gca,'Xlim',[0 20],'Ylim',[-2000,2000],'Xtick',[],'Ytick',[]);
text(12,-1700,'NS')

