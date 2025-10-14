% Exercice 1
% Question 1 & 2
%I = imread("LENA512.BMP");
%entropie(I)

% Question 3
%IConst = I+2;
%entropie(IConst)
% L'entropie est la même. Je pense que c'est normal :moyai:

% Question 4
SourI = imread("souris.bmp");
entropie(SourI)

% Souris a une entropie plus petite, donc elle sera plus facilement
% compressable.
figure(1);
histogram(SourI);

figure(2);
histogram(I);