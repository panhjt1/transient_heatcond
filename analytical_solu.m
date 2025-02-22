function the_the0 = analytical_solu(eta,Fo,Bi)
%the_the0 此处显示有关此函数的摘要
%   此处显示详细说明

series = 5;

fun = @(mu)tan(mu)-Bi/mu;
opt = optimoptions('fsolve','Display','none');
for i=1:series
    mu0 = (i-1)*pi+pi/4;
    mu(i) = fsolve(fun,mu0,opt);
end

fun = @(mu)2*sin(mu)/(mu+cos(mu)*sin(mu));
for i=1:series
    Cn(i) = fun(mu(i));
end

the_the0=0;
    for i = 1:series
        the_the0 = the_the0+ Cn(i)*exp(-mu(i)^2*Fo)*cos(mu(i)*eta);
    end

end