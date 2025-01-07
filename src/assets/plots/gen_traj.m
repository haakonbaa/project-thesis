t = 0:0.1:40;

xfunc = @(ts) 0.05*ts + 4.3273253410013846 + 0.1*exp(-ts);
yfunc = @(ts) 0.3*(1-exp(-ts/8)).*cos(ts/2);
zfunc = @(ts) 0.3*(1-exp(-ts/8)).*sin(ts/2);

pos = 200*[0 0 4 1];

fig = figure('Position', pos);
plot(t, xfunc(t)); hold on;
plot(t, yfunc(t));
plot(t, zfunc(t));
xlabel('t (s)', 'Interpreter', 'latex');
legend('$\sigma_{0,x}$, $\sigma_{0,y}$, $\sigma_{0,z}$', 'Interpreter', 'latex');
title('Trajectory of $\sigma_0$', 'Interpreter', 'latex');
grid on;
exportgraphics(fig, 'traj_xyz.pdf', 'ContentType', 'vector', 'Append', false);

fig = figure('Position', pos);
plot3(xfunc(t), yfunc(t), zfunc(t));
grid on;
title('Trajectory of $\sigma_0$', 'Interpreter', 'latex');
set(gca, 'YDir','reverse')
set(gca, 'ZDir','reverse')
xlabel('$\sigma_{0,x}$', 'Interpreter', 'latex');
ylabel('$\sigma_{0,y}$', 'Interpreter', 'latex');
zlabel('$\sigma_{0,z}$', 'Interpreter', 'latex');
exportgraphics(fig, 'traj_taskspace.pdf', 'ContentType', 'vector', 'Append', false);

