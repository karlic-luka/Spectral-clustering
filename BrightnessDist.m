function W = BrightnessDist(image, sigmaf, sigmax, radius)
  
  [h, w, channels] = size(image);
  if channels > 1
   image = double(rgb2gray(image));
  
  n = h*w;
  image = reshape(image, n, 1);
%  image = double(image) ./ 255;
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
%            fpart = 0;
            fpart = norm(image(i)-image(j), 2)^2 / (sigmaf^2);
            W(i,j) = exp(-0.5*fpart - 0.5*xpart);
            W(j,i) = W(i,j);
        end
      end
    end
  end
  
  
  
 end 