%% =============== This is the main1 file to implement linear regression on the dataset1 ===============

%% --------------- Loading and Visualising of data ---------------

data = load('ex1data1.txt');
X = data(:, 1);
y = data(:, 2);

% function to plot data in order to visualize
plotData(X, y);

fprintf("\nprogram is paused, press enter to continue\n");
pause;

%% --------------- Calculating cost and Gradient Descent ---------------

m = length(y);
n = size(X,2);
X = [ones(m, 1), X];
theta = zeros(n+1,1);
alpha = 0.01;

prevCost = costFunction(X, y, theta);
theta = gradientDescent(X, y, theta, alpha);

presentCost = costFunction(X, y, theta);
theta = gradientDescent(X, y, theta, alpha);

iter = 1;

while ((prevCost - presentCost) > 0.0001)
    subplot(1, 2, 1);
    drawnow;
    plot(iter, prevCost,'o');
    xlabel('Iterations');
    ylabel('Cost');
    hold on;
    
    subplot(1, 2, 2);
    drawnow;
    plotData(X(:, 2), y);
    hold on;
    plot(X(:, 2), X*theta, '-');
    legend('Training Data', 'Regression Line');
    hold off;
    
    prevCost = presentCost;
    presentCost = costFunction(X, y, theta);
    theta = gradientDescent(X, y, theta, alpha);
    iter = iter + 1;
   
    
end

%% Visualising the result

figure;
plotData(X(:, 2), y);
hold on;
plot(X(:, 2), X*theta, '-');
hold off;
