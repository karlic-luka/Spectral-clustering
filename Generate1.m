function dots = Generate1(m, k)
  
  % m = broj tocaka u clusteru
  % k = broj clustera
  
  dots = zeros(2, m*k);
  a = 1;
  b = 10;
  
  for i = 1 : k
    dots(1, (i-1)*m+1 : i*m) = a * randn(m,1) + b * (i-1);
    dots(2, (i-1)*m+1 : i*m) = a * randn(m,1) + b * (i-1);
  end
  
  dots = dots(:,randperm(m*k));
  
  %figure();
  %plot(dots(1,:), dots(2,:), 'x');
  
end
