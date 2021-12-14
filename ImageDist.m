function [W] = ImageDist(A, sigma, radius, improvement)
    [h, w, ~] = size(A);

    n = h*w;

    B = A; %rgb2lab(A);
  
    if improvement > 0
        % better color space
        B = rgb2oklab(A);
        B(:, :, 1) = B(:, :, 1) ./ 2;
    else
        B = B ./ 256;    
    end
    
    B = double(reshape(B, [] ,3));

    
    B(:, 4:5) = 0;

    counter = 1;
    for i = 1 : h
        for j = 1 : w
            B(counter, 4) = double(i) / h;
            B(counter, 5) = double(j) / w;
            counter = counter + 1;
        end
    end

    W = zeros(n);  
    for i = 1 : n
        for x = 0 : radius
            for y = 0 : radius
                if (x**2 + y**2 >= radius**2)
                    continue
                end
                
                j = i + x + y * w;
                if (j <= n)
                    
                    distance = norm(B(i, 1:3)-B(j, 1:3), 2);
                    W(i,j) = exp(-0.5 * distance^2 / sigma^2);
                    W(j,i) = W(i,j);
                end
            end
        end
    end
    
end
 