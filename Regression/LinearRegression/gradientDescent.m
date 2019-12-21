% function to calculate Gradient Descent
function theta = gradientDescent(X, y, theta, alpha)

m = length(y);
theta = theta - (alpha/m) * (X') * (X*theta - y);

end