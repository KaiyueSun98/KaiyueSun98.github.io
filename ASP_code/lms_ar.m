% x: input signal, no reference signal required
% mu: step size, learning rate
% order: estimated order
function [y_hat, e, a] = lms_ar(x, u, order)
    N = length(x);
    a = zeros(order, N-1);
    y_hat = zeros(N, 1);
    e = zeros(N, 1);
    
    % only start estimating once it has enough input data
    % 2nd order system will need at least 2 data points to start lms estimation
    for i = order+1:N
        x_hat = x(i-1:-1:i-order);
        y_hat(i) = (a(:, i-order).') * x_hat;
        e(i) = x(i) - y_hat(i);
        a(:, i-order+1) = a(:, i-order) + u * e(i) * x_hat;
        
    end
    
end