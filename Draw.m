function [] = Draw(X, A, s)
  % s je samo string za naslov da se zna koja je metoda
  [~, k] = size(X);
  
  figure()
  title(s)
  xlabel('x koordinata')
  ylabel('y koordinata')
 
  cmap = hsv(k);

    
  hold on;
  
  % ispisujte korak po korak da skuzite kako radi
  [f, c] = find(X);
  pocetak = 1;
  
  for i = 1 : k
    korak = length(find(c==i));
    ind = f(pocetak : pocetak + korak - 1);
    pocetak = pocetak + korak;
    plot (A(1, ind), A(2, ind), 'linestyle', 'none', 'Marker', 'x', 'Color', cmap(i, :))
  end
  grid on;
  hold off;
  
  %imagesc(X), colorbar;

end
