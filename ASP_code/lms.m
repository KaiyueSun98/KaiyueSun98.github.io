%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4 optimal filter - fixed and adaptive
%4.2 The least mean square algorithm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4.2.1
function [y_hat, e, w] = lms(x, z, u, order)
    N = length(x);
    w = zeros(order, N-order+1);
    y_hat = zeros(N, 1);
    e = zeros(N, 1);

    for i = order+1:N
        x_hat = x(i:-1:i-order+1);   %x(i-0).....x(i-Nw)   order=Nw+1
        y_hat(i) = (w(:, i-order).') * x_hat;
        e(i) = z(i) - y_hat(i);
        w(:, i-order+1) = w(:, i-order) + u * e(i) * x_hat;
    end
end


