function X = DACA(W, k, knn)

    epsilon = 1e-3;
    n = length(W);
        
   
    %W_z = getW_z(W, k);
    W_z = getW_z(W, knn);

    W_kapa = W .* W_z;
    % imagesc(W_z), colorbar

    D_kapa = diag(W_kapa * ones(n, 1));
    
    Q = D_kapa - W_kapa; % (D - W)e = 0;
    %imagesc(Q), colorbar;
    
    %if isinf(cond(Q))
    %  Q = Q + epsilon * eye(n);
    %end
    
    Q = Q + epsilon * eye(n); % da ne bude singularna matrica
    
    %SIMQ = issymmetric(inv(Q))
    %SIMW = issymmetric(W_kapa)
    %SIM = issymmetric(Q \ W_kapa)

    [P_t, Ls] = eigs(Q \ W_kapa, k); % P_tilda
    
    %K = diag(Ls); % ispadaju kompleksni brojevi??? (nije dobro sa abs(diag(Ls)))
    %[~, ind] = sort(abs(diag(Ls)), 'descend');
    %P_t = P_t(:, 1:k);
    
    % Normiranje redova
    P_t = P_t * diag(sum(P_t.^2, 1) .^ (-0.5)); % nije opcionalno mora se izvrstiti!
    
    X_t = diag(diag(P_t * P_t')) ^ (-0.5) * P_t;
       
    
    row_norms = diag(P_t * P_t');
    row_norms(row_norms < 1e-16) = 1;
    X_t = diag(row_norms) ^ -0.5 * P_t;
    
    X = Iter(X_t, n, k);
    
end