%% Plot the Drone Trajectory

t = state.time;

x = state.signals.values(:,1);
y = state.signals.values(:,2);
z = state.signals.values(:,3);

phi = state.signals.values(:,4);
theta = state.signals.values(:,5);
psi = state.signals.values(:,6);

xr = reference.signals.values(:,1);
yr = reference.signals.values(:,2);
zr = reference.signals.values(:,3);

fx = force.signals.values(:,1);
fy = force.signals.values(:,2);
fz = force.signals.values(:,3);

figure(1)

subplot(3,1,1)
plot(t,x,'r')
xlabel('t[s]')
ylabel('x[m]')
hold on; grid on
plot(t,xr,'--')
legend('Actual Trajectory', 'Reference Trajectory')

subplot(3,1,2)
plot(t,y,'b')
xlabel('t[s]')
ylabel('y[m]')
hold on; grid on
plot(t,yr,'--')
legend('Actual Trajectory', 'Reference Trajectory')

subplot(3,1,3)
plot(t,fx,'r')
xlabel('t[s]')
ylabel('F[N]')
hold on; grid on
plot(t,fy,'b')
legend('Fx', 'Fy')
