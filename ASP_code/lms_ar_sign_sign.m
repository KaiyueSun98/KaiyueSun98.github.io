function [y_hat, e, w] = lms_ar_sign_sign(x, mu, order)

    N = length(x); 
    w = zeros(order, N-1);
    y_hat = zeros(N, 1);  
    e = zeros(N, 1);
    for i = order+1:N
       
        x_hat = x(i-1:-1:i-order);
        
        y_hat(i) = (w(:, i-order).') * x_hat;
        
        
        e(i) = x(i) - y_hat(i);
        
        w(:, i-order+1) = w(:, i-order) + mu * sign(e(i)) * sign(x_hat);
        
    end
    
end