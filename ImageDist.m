function [W] = ImageDist(A, sigma, radius, improvement)
    [h, w, ~] = size(A);

    n = h*w;

    B = A;
  
    if improvement >= 1
        % better color space
        B = rgb2oklab(A);
        B(:, 1) = B(:, 1) / 2;
        %B = normalize(rgb2oklab(A), 'range');
        
    else
        B = B ./ 256;    
    end
    
    B = double(reshape(B, [] ,3));
    
    W = zeros(n);  
    for i = 1 : n
        for x = 0 : radius
            for y = 0 : radius
                if (x^2 + y^2 >= radius^2)
                    continue
                end
                
                j = i + x + y * w;
                if (j <= n) 
                    W(i,j) = exp( -0.5 * norm(B(i, 1:3)-B(j, 1:3), 2)^2 / sigma^2 );
                    W(j,i) = W(i,j);
                end
            end
        end
    end
    
end
 