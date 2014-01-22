week 1
======

```
image=imread('explosion.jpg');
imagengray = rgb2gray(image);
```
## Problem 1

```
new_image=reduce_intensity(imagengray, 128);
imshow(new_image);
```

## Problem 2
``` 
new_image=average_image(imagengray, 10);
imshow(new_image);
```

## Problem 3
```
new_image=imrotate(imagengray,45);
imshow(new_image);
```

## Problem 4
```
new_image=reduce_image_size(imagengray, 4);
imshow(new_image);
```
