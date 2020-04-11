%% Definition of Kalman Filter Matrixes
% We consider the augmented state xk = (x,f)

Ak = zeros(18,18);
Ak(1:15,1:15) = A;
Ak(4:6,16:18) = 1/m*eye(3);

Bk = zeros(18,4);
Bk(1:15,1:4) = B(1:15,1:4);

Ck = zeros(6,18);
Ck(1:3,1:3) = eye(3);
Ck(4:6,7:9) = eye(3);

Dk = zeros(6,4);

v = 0.001*ones(6,1); 

Tn = 0.001;
W = 1000*eye(18); % Noise Matrixes
V = 10*eye(6);

% Computation of Kalman Gain

[R,P,E] = lqe(Ak,eye(18),Ck,W,V); % Kalman Gain

