% Define the function
f = @(x) x.^3 - 2*x.^2 -4;

% Define the interval [a, b]
a = 0;
b = 3;

% Set the tolerance for convergence
tolerance = 1e-6;

% Initialize matrices to store root and iteration information
roots = [];
iterations = [];

% Bisection method
while (b - a) > tolerance
    c = (a + b) / 2;  % Midpoint of the interval
    roots = [roots; c];  % Store the root
    iterations = [iterations; abs(f(c))];  % Store the function value at the root
    
    if f(c) == 0
        break;
    elseif f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
end

% Display the final root
fprintf('Approximate root: %f\n', c);

% Plot the function
x = linspace(-1, 3, 1000);
y = f(x);

figure;
plot(x, y, 'b-', roots, zeros(size(roots)), 'ro');
xlabel('x');
ylabel('f(x)');
title('Bisection Method Root-Finding');
legend('f(x)', 'Roots');
grid on;
