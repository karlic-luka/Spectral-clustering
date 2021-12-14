# Spectral-clustering


## Pozivi funkcija

k = 9; A = Generate2(20, 3, 3); W = Dist(A, k); X = MSC(W, k); Draw(X, A, "MSC");

k = 9; A = Generate2(20, 3, 3); W = Dist(A, k); X = DACA(W, k, 15); Draw(X, A, "DACA");

k = 8; sigma = 3; knn = 60; A = Generate3(70, 3, 3); W = Dist(A, sigma); X = DACA(W, k, 30); Draw(X, A, "DACA");


### small kanye
#### 1)
A = imread('kanye_small.png'); W = ImageDist(A, 10, 10, 1); imagesc(W)

X = DACA(W, 5, 7); DrawImg(X, A, "DACA");

#### 2) bolji
A = imread('kanye_small.png'); W = ImageDist(A, 10, 15, 1); imagesc(W)

X = DACA(W, 7, 10); DrawImg(X, A, "DACA");
