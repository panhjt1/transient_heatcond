delta = 0.36/2;% m 半板厚
n=5;% 节点数
dx = delta/(n-1);% 步长
node_x = 0:dx:delta-dx/2;
node_x(1)  =0;
node_x(n)=delta;
node_eta=node_x/delta;

t_f=1000;% ℃
t_0=20;% 初始温度
h=1200;% 传热系数
dtau = 1;%s
tau = 2961;%s 总时长

lambda = 50;% W/(m`k)
a = 1.39e-5;% a=lambda/rho cp , m2/s
rcp = lambda / a;

Bi = h*delta/lambda;
Fo = a*tau/(delta^2);