% Definition of the Matrixes and Parameters for the Admittance Controller,
% taking into account that for human-quadcopter interaction the stiffness
% will be zero

% Apparent Inertia
m_ad = 0.9; %[kg]
M = eye(3)*m;

% Desired Damping 
d_ad = 0.9; % Damping Coefficient
Damp = eye(3)*d_ad;

% Desired Stiffness
stiff = input('Insert value of Stiffness. We recommend 0.9 for hybrid force/position and 0 for force control: ');
K = stiff*eye(3);

A_ad = [zeros(3,3), eye(3); 
        -inv(M)*K, -inv(M)*Damp];
    
B_ad = [zeros(3,3), zeros(3,3);
        inv(M)*K, inv(M)];
    
C_ad = [eye(3), zeros(3,3)];

D_ad = zeros(3,6);

% Desired Problem

if stiff == 0
    p = 0;
else
    p = menu('Choose the problem: 1 for trajectory tracking and 2 for regulation', 1,2);
end
