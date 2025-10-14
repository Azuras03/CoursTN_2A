function [res] = psnr(I,J)
    ImI = double(I);
    ImJ = double(J);
    [w,h] = size(ImI);
    d = 0;
    for m = 1:w
        for n = 1:h
            d = (ImI(m,n)-ImJ(m,n))^2;
        end
    end

    d = d/w*h;

    res = 10 * log10((2^(8) -1)^2 / d);

end