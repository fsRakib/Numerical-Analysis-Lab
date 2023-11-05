% Define two matrices A & B
A = input('Enter matrix A: ');
B = input('Enter matrix B: ');

% Print the max value from matrix A
max_val = max(A(:));
fprintf('The maximum value in matrix A is: %d\n', max_val);

% Multiply matrix A & B
try
    C = A * B;
    fprintf('The product of matrices A and B is:\n');
    disp(C);
catch e
    fprintf('Matrix multiplication is not possible.\n');
end
