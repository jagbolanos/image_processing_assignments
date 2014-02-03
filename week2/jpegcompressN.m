function new_image = jpegcompressN(image, block_size, N)
    [width, height] = size(image);
    b_width = floor(width / block_size);
    b_height = floor(height / block_size);
     
    new_image = zeros(b_width * block_size, b_height * block_size);
    for x = 1:b_width
        for y = 1:b_height
            %Extract the block
            block = image((x-1)*block_size+1:x*block_size,(y-1)*block_size+1:y*block_size);
            %DCT
            dct_block = dct(block);
            
            %Quantization
            dct_block = floor(dct_block / N);
            
            %Dequantization
            idct_block = dct_block * N;
            
            %Inverse DCT
            new_block = idct(idct_block);
            %Put the new block
            new_image((x-1)*block_size+1:x*block_size,(y-1)*block_size+1:y*block_size) = new_block;
        end
    end
    
    new_image = mat2gray(new_image);
end