function new_image = jpegcompress(image, block_size, N)
    [width, height] = size(image);
    b_width = floor(width / block_size);
    b_height = floor(height / block_size);
    
    quantization_matrix = [16 11 10 16 24 40 51 61; 
         12 12 14 19 26 58 60 55;
         14 13 16 24 40 57 69 56;
         14 17 22 29 51 87 80 62;
         18 22 37 56 68 109 103 77;
         24 35 55 64 81 104 113 92;
         49 64 78 87 103 121 120 101;
         72 92 95 98 112 100 103 99];
     
    new_image = zeros(b_width * block_size, b_height * block_size);
    for x = 1:b_width
        for y = 1:b_height
            %Extract the block
            block = image((x-1)*block_size+1:x*block_size,(y-1)*block_size+1:y*block_size);
            %DCT
            dct_block = dct(block);
            
            %dct_block = floor(dct_block / N) * N;
            
            %Quantization
            dct_block = round(dct_block ./ quantization_matrix);
            
            %Dequantization
            idct_block = dct_block .* quantization_matrix;
            
            %Inverse DCT
            new_block = idct(idct_block);
            %Put the new block
            new_image((x-1)*block_size+1:x*block_size,(y-1)*block_size+1:y*block_size) = new_block;
        end
    end
    
    new_image = mat2gray(new_image);
end