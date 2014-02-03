function new_image = jpegcompresscolor(image) 
    ycbcr_image = rgb2ycbcr(image);
    [width, height, depth] = size(image);
    
    new_image = zeros(floor(width/8)*8, floor(height/8)*8, 3);
    
    for i=1:depth
        new_image(:,:,i) = jpegcompressdct(ycbcr_image(:,:,i));
    end
    
    new_image = ycbcr2rgb(new_image);
    
end