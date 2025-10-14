% Exercice 2

% Question 1

SourI = imread("souris.bmp");
psnr(SourI, SourI)

% Question 2

SourINoise = imnoise(SourI);
psnr(SourI, SourINoise)
% Quand le bruit augmente, le PSNR se réduit.