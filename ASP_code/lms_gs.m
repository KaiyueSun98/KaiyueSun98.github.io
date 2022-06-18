%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4 optimal filter - fixed and adaptive
%4.3 gear shifting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [y_hat, e, w] = lms_gs(x, z, u, order)
    N = length(x);
    w = zeros(order, N-order+1);
    y_hat = zeros(N, 1);
    e = zeros(N, 1);
    u1=u;

    for i = order+1:N
        x_hat = x(i:-1:i-order+1);   %x(i-0).....x(i-Nw)   order=Nw+1
        y_hat(i) = (w(:, i-order).') * x_hat;
        e(i) = z(i) - y_hat(i);
        if abs(e(i))<abs(e(i-1))
        u1 = u1/1.1;
        else
        u1 = u1*1.1;
        end
        w(:, i-order+1) = w(:, i-order) + u1 * e(i) * x_hat;
         
        
    end
end
