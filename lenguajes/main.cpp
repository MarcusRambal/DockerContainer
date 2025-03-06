#include <iostream>
#include <vector>
#include <chrono>
#include <cstdlib>

using namespace std;
using namespace chrono;

vector<vector<int>> generateMatrix(int n) {
    vector<vector<int>> matrix(n, vector<int>(n));
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            matrix[i][j] = rand() % 10;
        }
    }
    return matrix;
}

vector<vector<int>> multiplyMatrices(const vector<vector<int>>& A, const vector<vector<int>>& B) {
    int n = A.size();
    vector<vector<int>> C(n, vector<int>(n, 0));

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            for (int k = 0; k < n; k++) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
    return C;
}

void benchmark(int n = 300) {
    vector<vector<int>> A = generateMatrix(n);
    vector<vector<int>> B = generateMatrix(n);

    auto start = high_resolution_clock::now();
    multiplyMatrices(A, B);
    auto end = high_resolution_clock::now();

    double elapsedMs = duration<double, milli>(end - start).count();
    cout << "Tiempo de ejecución: " << elapsedMs << " ms" << endl;
}

int main(int argc, char* argv[]) {
    int n = (argc > 1) ? atoi(argv[1]) : 300;
    benchmark(n);
    return 0;
}
