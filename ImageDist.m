function [W] = ImageDist(A, sigma, radius)
  [h, w, ~] = size(A);
  
  n = h*w;
  
  B = A;%rgb2lab(A);
  B = double(reshape(B, [] ,3));

  B = B ./ 255;
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
        for x = 1 : radius
            for y = 1 : radius
                if (abs(x) + abs(y) > radius)
                    continue
                end
                
                j = i + x + y * w;
                if (j > 0 && j <= n)
                    W(i,j) = exp(-0.5 * norm(B(i, 1:3)-B(j, 1:3), 2)^2 / sigma^2);
                    W(j,i) = W(i,j);
                end
            end
        end
    end
    
    % A = imread('gogh.jpg'); W = ImageDist(A(1:50, 1:50, :), 0.5); imagesc(W)
end
 