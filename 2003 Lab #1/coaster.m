syms t

g = 9.81;                                                                   % [m/s^2]
h_0 = 125;                                                                  % [m]



%% Path Definition
timerange = 1:0.1:6;                                                        % evaluate sector one from 1-4sec
assume(t > 0);
%sector 1

x(t) = piecewise(0<t<4,0, 4<=t<=5,2*t, 5<t<6,3*t);                                                                 % no movement in x,y
y(t) = piecewise(0<t<4,0, 4<=t<=5,3*t, 5<t<6,2*t);
z(t) = piecewise(0<t<4,125 - 0.5*g*t^2, 4<=t<=5,46.52-t, 5<t<6, t);                                                     % freefall

x_position = feval(x, timerange);       
y_position = feval(y, timerange);
z_position = feval(z, timerange);




%% Plot
figure(1);
title('Rollercoaster Path!');
plot3(x_position, y_position, z_position, 'red');
hold on
grid minor
xlabel('X Position (m)');
ylabel('Y Position (m)');
zlabel('Z Position (m)');
hold off