function t_s0 = num_solu(Fo,Bi,n,dtau,tau,t_0,t_f)
%NUM_SOLU 此处显示有关此函数的摘要
%   此处显示详细说明
%  >*-*--*--*-*||

t_s0 = ones(length(0:dtau:tau),n)*t_0;
t_s  = ones(1,n)*t_0;

k=1;
for tt = 0:dtau:tau
    for i =1:n
        if i ==1
            t_s(i) = t_s0(k,i) + (t_s0(k,i+1) - t_s0(k,i)) * 2 * Fo * (dtau/tau) * (n-1)^2;
        elseif i == n
            t_s(i) = t_s0(k,i)...
                + (t_f-t_s0(k,n)) * 2 * Bi * Fo* (dtau/tau) * (n-1)...
                + (t_s0(k,n-1) - t_s0(k,n)) * 2 * Fo * (dtau/tau) * (n-1)^2;
        else
            t_s(i) = t_s0(k,i) + (t_s0(k,i+1) - 2*t_s0(k,i) + t_s0(k,i-1)) * Fo * (dtau/tau) * (n-1)^2;
        end
    end
    t_s0(k+1,:) = t_s;
    k=k+1;
end
end

