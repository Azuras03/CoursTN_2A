function [entr] = entropie(I)
    Img = double(I);
    entr = 0;
    [w, h] = size(Img);
    totalPixels = w*h;
    p = zeros(512);
    Img = Img +1; % Pour éviter que des pixels à 0 retournent une erreur, merci Matlab de commencer à 1 les tableaux
    for i = 1:w
        for j = 1:h
            p(Img(i,j)) = p(Img(i,j))+1;
        end
    end

    p = p / totalPixels;
    for k = 1:512
        if p(k) > 0
            entr = entr - p(k) * log2(p(k));
        end
    end
end