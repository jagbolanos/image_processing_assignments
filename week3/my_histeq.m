function J = my_histeq(I)
    [width, height] = size(I);
    pixels = width * height;
    bins = zeros(256,1);
    for x = 1:width
        for y = 1:height
            index = I(x,y) + 1;
            bins(index) = bins(index) + 1;
        end
    end
    
    cdf = cumsum(bins);
    
    cdf_min = 1;
    while cdf(cdf_min) == 0
        cdf_min = cdf_min + 1;
    end
    L = 256;
    
    new_cdf = zeros(256,1);
    for i = 1:256
        new_cdf(i) = round((cdf(i) - cdf_min) / (pixels - cdf_min) * (L - 1));
    end
    
    J = I;
    
    for x = 1:width
        for y = 1:height
            index = I(x,y) + 1;
            J(x,y) = new_cdf(index);
        end
    end
end