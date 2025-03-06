import random
import time
import sys

def generate_matrix(n):
    return [[random.randint(0, 9) for _ in range(n)] for _ in range(n)]

def multiply_matrices(A, B):
    n = len(A)
    C = [[0] * n for _ in range(n)]
    for i in range(n):
        for j in range(n):
            for k in range(n):
                C[i][j] += A[i][k] * B[k][j]
    return C

def benchmark(n=300):
    A = generate_matrix(n)
    B = generate_matrix(n)

    start = time.time()
    C = multiply_matrices(A, B)
    end = time.time()

    elapsed_ms = (end - start) * 1000
    print(f"Tiempo de ejecución: {elapsed_ms:.3f} ms")
    print(f"Tamaño de la matriz resultante: {len(C)}x{len(C[0])}")

if __name__ == "__main__":
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 300
    benchmark(n)
