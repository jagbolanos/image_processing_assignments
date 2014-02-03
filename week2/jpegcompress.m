function new_image = jpegcompress(image) 
    
    [width, height, depth] = size(image);
    
    if (depth == 3) 
        ycbcr_image = rgb2ycbcr(image);
        Y = uint8(jpegcompressdct(ycbcr_image(:,:,1)));
        Cb = uint8(jpegcompressdct(ycbcr_image(:,:,2)));
        Cr = uint8(jpegcompressdct(ycbcr_image(:,:,3)));
    
        new_image = cat(3, Y, Cb, Cr);
    
        new_image = ycbcr2rgb(new_image);
    else
        new_image = mat2gray(jpegcompressdct(image));
    end
    
end