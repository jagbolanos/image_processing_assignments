function new_image = rotate_image(original_image, angle)
    R = [cos(angle) -sin(angle); sin(angle) cos(angle)];
    [width, height] = size(original_image);
    new_image = zeros(width, height);
    max_side = max(width, height) / 2;
    for x=1:width
        for y=1:height
            new_position = R * [(x-1 - max_side)/max_side;(y-1 - max_side)/max_side];
            new_x = floor(new_position(1) * max_side + max_side + 1);
            new_y = floor(new_position(2) * max_side + max_side + 1);
            if (new_x >= 1 && new_x <= width && new_y >= 1 && new_y <= height)
                new_image(new_x, new_y) = original_image(x, y);
            end
        end
    end
    new_image = mat2gray(new_image);
end