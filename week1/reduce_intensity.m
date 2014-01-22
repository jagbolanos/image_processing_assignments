function new_image = reduce_intensity(grayscale_image, levels)
    [width, height] = size(grayscale_image);
    new_image = grayscale_image;
    for x = 1:width
        for y = 1:height
          new_image(x,y) = floor(new_image(x,y)/levels) * levels; 
        end
    end
end