function [J, grad] = costFunctionReg(theta, X, y, lambda)
    %COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
    %   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
    %   theta as the parameter for regularized logistic regression and the
    %   gradient of the cost w.r.t. to the parameters. 

    % You need to return the following variables correctly 
    J = 0;
    grad = zeros(size(theta));

    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the cost of a particular choice of theta.
    %               You should set J to the cost.
    %               Compute the partial derivatives and set grad to the partial
    %               derivatives of the cost w.r.t. each parameter in theta

    m = length(y);                        % number of training examples

    prediction = sigmoid(X * theta);      % hypothesis function, prediction, h_theta(x)
    
    theta_r = theta(2:size(theta));
    
    theta_reg = [0; theta_r];

    J = ((-y' * log(prediction) - (1 - y)' * log(1 - prediction)) / m) + (lambda/ (2*m) * theta_reg'* theta_reg);
    
    grad = 1/m * (X' * (prediction - y)) + lambda * theta_reg/m; 

% =============================================================

end
