function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
    C = 1;
    sigma = 0.3;

 % C= 0.01; sigma = 0.03; 0.1; 0.3; 1; 3; 10; 30
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%Train the model using svmTrain with X, y, a value for C, and the gaussian kernel using a value for sigma. 
%See ex6.m at line 108 for an example of the correct syntax to use in calling svmTrain() and the gaussian kernel. 
%Note: Use temporary variables for C and sigma when you call svmTrain(). 
%Only use 'C' and 'sigma' for the final values you are going to return from the function.

    C_list = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
    s_list = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
    err_min = inf;
% create a blank results matrix
%results = zeros(length(C_list) * length(s_list), 3)   
%row = 1;

    for C_val = C_list
        for sigma_val = s_list
          
          model = svmTrain(X, y, C_val, @(x1, x2) gaussianKernel(x1, x2, sigma_val));
          
          predictions = svmPredict(model, Xval);
          
          err_val = mean(double(predictions ~= yval));
    
          if err_val < err_min
          
              C = C_val;
              sigma = sigma_val;
              err_min = err_val;
   
              C_final = C;
              sigma_final = sigma;
           
   
          endif
                          
                 
        endfor
    endfor
%save the results in the matrix
%      results(row,:) = [C_val sigma_val err_val]
%      row = row + 1;
% use the min() function on the results matrix to find 
% the C and sigma values that give the lowest validation error

%[C sigma] = min(results(:,3);
    C = C_final;
    sigma = sigma_final;



% =========================================================================

end
