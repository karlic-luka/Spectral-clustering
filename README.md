# Spectral-clustering


## Pozivi funkcija

k = 9; A = Generate2(20, 3, 3); W = Dist(A, k); X = MSC(W, k); Draw(X, A, "MSC");

k = 9; A = Generate2(20, 3, 3); W = Dist(A, k); X = DACA(W, k, 15); Draw(X, A, "DACA");

k = 8; sigma = 3; knn = 60; A = Generate3(70, 3, 3); W = Dist(A, sigma); X = DACA(W, k, 30); Draw(X, A, "DACA");
