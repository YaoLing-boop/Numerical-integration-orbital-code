%% Initialization and pre-allocation
clear
dt = 0.01;
T = 100;          
t = (0:dt:T)';   % Time array, can be extended by increasing value of T
N = length(t);

x = zeros(N,1);
v = zeros(N,1);
y = zeros(N,1);
w = zeros(N,1);
x(1) = 1;
y(1) = 0;
v(1) = 0.3;
w(1) = 1;
%% Numerical integration
for i = 1:N-1
    t1 = x(i)^2+y(i)^2;
    a1 = -x(i)/(t1^(3/2));
    b1 = -y(i)/(t1^(3/2));
    v(i+1) = v(i)+a1*dt;
    w(i+1) = w(i)+b1*dt;
    x(i+1) = x(i)+v(i+1)*dt;
    y(i+1) = y(i)+w(i+1)*dt;
end
%% Animation Section
p2 = plot(x(1),y(1),'o',0,0,'o')
p2(1).MarkerFaceColor = p2(1).Color;
p2(2).MarkerFaceColor = p2(2).Color;
xlim([-2 2])
ylim([-2 2])
set(gcf,'color','w');
title('Semi-Implicit Euler Method for Simple Orbits')
hold on
for i = 2:N
    pause(30/N)
    p2(1).XData = x(i);
    p2(1).YData = y(i);
end

hold off



