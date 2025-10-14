function [ImQ, debBinMax, debEntr] = QSU(I,nb_niveaux)
    % d = min(min(I));
    [w, h] = size(I);
    d = 0;
    I = double(I);
    q = 255/nb_niveaux;
    Q = [];
    ImQ = zeros(w,h);
    for x = 1:255
        if x == 255
            Q(x) = (floor((x-d-1)/q)+1/2)*q+d;
        else
            Q(x) = (floor((x-d)/q)+1/2)*q+d;
        end
    end
    debBinMax = log2(nb_niveaux);
   
    p = zeros(512);
    I = I+1; % Pour éviter que des pixels à 0 retournent une erreur, merci Matlab de commencer à 1 les tableaux
    for i = 1:w
        for j = 1:h
            p(I(i,j)) = p(I(i,j))+1;
        end
    end

    debEntr = 0;
    for k = 1:nb_niveaux
        debEntr = debEntr - p(k)*log2(p(k));
    end

    % Parcours pour transformer l'image Q
    for i = 1:w
        for j = 1:h
            ImQ(i,j) = Q(I(i,j));
        end
    end
    ImQ
end