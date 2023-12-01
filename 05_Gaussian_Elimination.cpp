#include<bits/stdc++.h>
using namespace std;

// Function to perform Naive Gauss Elimination
void gaussElimination(vector<vector<double>>& A, vector<double>& B, int n)
{
    for (int i = 0; i < n; i++)
    {
        for (int j = i + 1; j < n; j++)
        {
            double factor = A[j][i] / A[i][i];

            for (int k = i; k < n; k++)
            {
                A[j][k] -= factor * A[i][k];
            }
            B[j] -= factor * B[i];
        }
    }

    // Back substitution
    for (int i = n - 1; i >= 0; i--)
    {
        for (int j = i + 1; j < n; j++)
        {
            B[i] -= A[i][j] * B[j];
        }
        B[i] /= A[i][i];
    }
}

int main()
{
    // Given velocity data
    vector<double> time = {5, 8, 12};
    vector<double> velocity = {106.8, 177.2, 279.2};

    // Size of the system of equations
    int n = 3;

    // Coefficients matrix
    vector<vector<double>> A(n, vector<double>(n, 0));

    // Right-hand side vector
    vector<double> B(n, 0);

    // Set up the system of equations
    for (int i = 0; i < n; i++)
    {
        A[i][0] = time[i] * time[i];
        A[i][1] = time[i];
        A[i][2] = 1;
        B[i] = velocity[i];
    }

    // Perform Naive Gauss Elimination
    gaussElimination(A, B, n);

    // Output the results
    cout << "Answer 1: "<<endl;
    cout << " Coefficient a1: " << B[0] << endl;
    cout << " Coefficient a2: " << B[1] << endl;
    cout << " Coefficient a3: " << B[2] << endl;

    // Find velocity at t=6 seconds using the obtained coefficients
    double t = 6;
    double result = B[0] * t * t + B[1] * t + B[2];
    cout << "Answer 2:\n Velocity at t=6 seconds: " << result << " m/s" << endl;

    return 0;
}
