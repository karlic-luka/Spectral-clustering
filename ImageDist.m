function [W] = ImageDist(A, sigma)
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
        for j = 1 : i
            W(i,j) = exp(-0.5 * norm(B(i, :)-B(j, :), 2)^2 / sigma^2);
            W(j,i) = W(i,j);
        end
    end
    
    % A = imread('gogh.jpg'); W = ImageDist(A(1:50, 1:50, :), 0.5); imagesc(W)
end
 