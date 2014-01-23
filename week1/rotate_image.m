function new_image = rotate_image(original_image, angle)
    R = [cos(angle) -sin(angle); sin(angle) cos(angle)];
    [width, height] = size(original_image);
    
    [tl_x, tl_y] = rotate_position(1, 1, R, width, height, width, height);
    [bl_x, bl_y] = rotate_position(1, height, R, width, height, width, height);
    [tr_x, tr_y] = rotate_position(width, 1, R, width, height, width, height);
    [br_x, br_y] = rotate_position(width, height, R, width, height, width, height);
    
    new_width = max([tl_x bl_x tr_x br_x]) - min([tl_x bl_x tr_x br_x]) + 1;
    new_height = max([tl_y bl_y tr_y br_y]) - min([tl_y bl_y tr_y br_y]) + 1;
    
    new_image = zeros(new_width, new_height);
    for x=1:width
        for y=1:height
            [new_x, new_y] = rotate_position(x, y, R, width, height, new_width, new_height);
            if (new_x >= 1 && new_x <= new_width && new_y >= 1 && new_y <= new_height)
                new_image(new_x, new_y) = original_image(x, y);
            end
        end
    end
    new_image = mat2gray(new_image);
end

function [new_x, new_y] = rotate_position(x, y, R, width, height, new_width, new_height)
    max_side = max(width, height) / 2;
    new_position = R * [(x-1 - width/2)/max_side;(y-1 - height/2)/max_side];
    new_x = floor(new_position(1) * max_side + new_width/2 + 1);
    new_y = floor(new_position(2) * max_side + new_height/2 + 1);
end