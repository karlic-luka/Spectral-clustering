% Primjer1

k1 = 4;
A1 = Generate1(40, k1);

X1_1 = MSC(Dist(A1), k1);
Draw(X1_1, A1, 'Primjer1 - MSC');

X1_2 = DACA(A1, k1);
Draw(X1_2, A1, 'Primjer1 - DACA');


% Primjer2

k21 = 3; k22 = 2; k2 = k21*k22;
A2 = Generate2(40, k21, k22);

X2_1 = MSC(Dist(A2), k2);
Draw(X2_1, A2, 'Primjer2 - MSC');

X2_2 = DACA(A2, k2);
Draw(X2_2, A2, 'Primjer2 - DACA');

% Primjer3

k31 = 2; k32 = 2; k3 = k21*k22;
A3 = Generate3(40, k31, k32);

X3_1 = MSC(Dist(A3), k3);
Draw(X3_1, A3, 'Primjer3 - MSC');

X3_2 = DACA(A3, k3);
Draw(X3_2, A3, 'Primjer3 - DACA');