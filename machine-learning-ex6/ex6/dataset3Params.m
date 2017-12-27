function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.1;

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
%
accuracy = 0.1;
maybe1 = [0.001 0.002 0.003 0.005];
maybe2 = [0.045 0.055 0.065];
maybe = [0.01 0.03 0.1 0.3 1 3 10 30];
for c = maybe
   for s = maybe
      model = svmTrain(X, y, c, @gaussianKernel, 1e-3, 20, s);
      predictions = svmPredict(model, Xval,s);
      accuracy1 = mean(double(predictions ~= yval));
      display(accuracy1);
      if accuracy1 < accuracy
         accuracy = accuracy1;
         C = c;
         sigma = s;
      end
   end
end

display(accuracy);




% =========================================================================

end
