function X = DACA(W, k, knn)

    epsilon = 1e-3;
    n = length(W);
        
    W_z = getW_z(W, knn);

    W_kapa = W .* W_z;
    %imagesc(W_kapa), colorbar

    D_kapa = diag(W_kapa * ones(n, 1));
    
    Q = D_kapa - W_kapa; % (D - W)e = 0;
    %imagesc(Q), colorbar;
    
    Q = Q + epsilon * eye(n); % da ne bude singularna matrica
    

    [P_t, Ls] = eigs(Q \ W_kapa, k); % P_tilda
  
    % Normiranje redova
    % P_t = P_t * diag(sum(P_t.^2, 1) .^ (-0.5)); % normirat cemo rucno jer moze biti 0 na dijagonalama
           
    row_norms = diag(P_t * P_t');
    row_norms(row_norms < 1e-16) = 1;
    X_t = diag(row_norms) ^ -0.5 * P_t;
    
    X = Iter(X_t, n, k);
    
end