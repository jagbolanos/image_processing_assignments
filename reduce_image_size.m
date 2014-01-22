function new_image = reduce_image_size(original_image, window_size)
    [width, height] = size(original_image);
    new_width = floor(width / window_size);
    new_height = floor(height / window_size);
    new_image = zeros(new_width, new_height);
    pixels = window_size * window_size;
    for x = 1:new_width
        for y = 1:new_height
            new_image(x,y) = floor(sum(sum(original_image(window_size*(x-1)+1:window_size*x, window_size*(y-1)+1:window_size*y))) / pixels);
        end
    end
    new_image = mat2gray(new_image);
end