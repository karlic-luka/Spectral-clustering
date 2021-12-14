function W = BrightnessDist(A, sigmaf, sigmax, radius)
  
  [h, w, ~] = size(A);
    
  image = image ./ 255;
%  size(image)
%  imagesc(image); colormap(gray);
  n = h*w;
  image = reshape(image, n, 1);
%    
  W = zeros(n);
%  
  for i = 1 : n
    for x = 0 : radius
      for y = 0 : radius
        d = x**2 + y**2;
        if (d >= radius**2)
            continue
        end
       
        j = i + x + y * w;
        if (j <= n)
            xpart = d / (sigmax**2);
            fpart = norm(image(i)-image(j), 2)^2 / (sigmaf^2); %potencijalno sam retardiran
            W(i,j) = exp(-0.5*fpart - 0.5*xpart);
            W(j,i) = W(i,j);
        end
      end
    end
  end
  
  
  
 end 