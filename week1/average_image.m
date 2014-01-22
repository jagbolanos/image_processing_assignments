function new_image = average_image(original_image, window_size)
    [width, height] = size(original_image);
    minimum = -floor((window_size-1)/2);
    maximum = window_size - 1 + minimum;
    new_image = original_image;
    pixels = window_size * window_size;
    for x = 1-minimum:width-maximum
        for y = 1-minimum:height-maximum
            new_image(x,y) = sum(sum(original_image(x+minimum:x+maximum, y+minimum:y+maximum))) / pixels;
        end
    end
end