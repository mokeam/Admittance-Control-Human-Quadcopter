% Definition of the Matrixes and parameters for the linearized model of the
% quadrotor. Initialization for the Simulink Model and Definition of the
% time constants for the reaction between the generated torque and the
% commanded inputs (rotational rates)

clear all
close all
clc

%% Vehichle Parameters

g = 9.81;   % [ms^-2]
Ix = 0.5;   % [kg*m^2]
Iy = 0.5;
Iz = 0.9;
Ir = 0.005;
Om_r = 70;  % [s^-2]
m = 2;      % [kg]
l = 0.25;   % [m]
d = 0.03;
m1 = 0.1;

par = [m;m1;Ix;Iy;Iz;Ir;Om_r;d;l;g];

% Controller Gains / Time constants 

T1 = 0.001;
T2 = 0.001;

%% Initial State

x0 = 0;
y0 = 0;
z0 = 0;
vx0 = 0;
vy0 = 0;
vz0 = 0;
phi0 = 0;
theta0 = 0;
psi0 = 0;
p0 = 0;
q0 = 0;
r0 = 0;
tau_phi0 = 0;
tau_theta0 = 0;
tau_psi0 = 0;

init_state = [x0 y0 z0  vx0 vy0 vz0 phi0 theta0 psi0 p0 q0 r0 tau_phi0 tau_theta0 tau_psi0]';

%% Definition of Matrices for Linear Model
% X = A.x + B.u + w
% Y = C.x + D.u + v

% Matrix A
A = zeros(15,15);
A(1:3,4:6) = eye(3);
A(4,8) = -g;
A(5,7) = g;
A(7:9,10:12) = eye(3);
A(10,13) = 1/Ix;
A(11,14) = 1/Iy;
A(12,15) = 1/Iz;
A(13,10) = -Ix/(T1*T2);
A(14,11) = -Iy/(T1*T2);
A(15,12) = -Iz/(T1*T2);
A(13:15,13:15) = -1/T1*eye(3);

% Matrix B defined to include external force seen as noise
B = zeros(15,7);
B(6,1) = -1;
B(4:6,5:7) = 1/m*eye(3);
B(13,2) = Ix/(T1*T2);
B(14,3) = Iy/(T1*T2);
B(15,4) = Iz/(T1*T2);

% Matrix C and D
C = zeros(6,15);
C(1:3,1:3) = eye(3);
C(4:6,7:9) = eye(3);

D = zeros(6,7);


