function I = read_image(file_name, rows, cols)
 
I = imread(file_name);
[h, w, channels] = size(I);

if (channels > 1)
    I = double(rgb2gray(I));
else
    I = double(I);
end

I = imresize(I, [rows, cols], 'bicubic');