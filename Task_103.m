% Define your function to find the root for (modify this function as needed)
f = @(x) x.^3 - 2*x.^2- 4;  

% Initial guesses and tolerance level
x0 = 0;
x1 = 3;
tol = 1e-6;

roots_matrix = [];

while abs(x1 - x0) > tol
    % False-Position method
    x2 = x1 - (x1 - x0) * f(x1) / (f(x1) - f(x0));
    roots_matrix = [roots_matrix; x2];
    
    x0 = x1;
    x1 = x2;
end

x = linspace(0, 4, 100);
y = f(x);

figure;
plot(x, y, 'b', 'LineWidth', 2);
hold on;

plot(roots_matrix, f(roots_matrix), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
xlabel('x');
ylabel('f(x)');
title('False-Position Method for Root Finding');
grid on;
legend('Function', 'Roots');

disp('Roots found:');
disp(roots_matrix);


