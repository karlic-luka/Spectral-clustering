function W_z = getW_z(W, k)  
    n = length(W);
    W_z = zeros(n);
   
    for i = 1 : n
        [~, I] = sort(W(i,:), 'descend');           
        W_z(i, I(1:k)) = 1;
    end
    
    W_z = W_z | W_z';
     
end