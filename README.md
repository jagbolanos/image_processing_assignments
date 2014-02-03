Week 1
======

```
image=imread('explosion.jpg');
imagengray = rgb2gray(image);
```

#### Problem 1

```
new_image=reduce_intensity(imagengray, 128);
imshow(new_image);
```

#### Problem 2
``` 
new_image=average_image(imagengray, 10);
imshow(new_image);
```

#### Problem 3

###### Custom function
```
new_image=rotate_image(imagengray, 3.1416 / 2);
imshow(new_image);
```

###### Using just Matlab
```
new_image=imrotate(imagengray,45);
imshow(new_image);
```

#### Problem 4
```
new_image=reduce_image_size(imagengray, 4);
imshow(new_image);
```

Week 2
========

#### Problem 1

###### DCT+Quantization Table 8x8 - RGB and Grayscale
```
new_image = jpegcompress(image);
imshow(new_image);

new_image = jpegcompress(imagengray);
imshow(new_image);
```

###### FFT+Quantization Table 8x8 - Grayscale
```
new_image = jpegcompressfft(imagengray);
imshow(new_image);
```

