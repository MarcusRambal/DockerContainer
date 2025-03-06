import java.util.Random;

public class Solucion {

    public static int[][] generateMatrix(int n) {
        Random rand = new Random();
        int[][] matrix = new int[n][n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                matrix[i][j] = rand.nextInt(10);
            }
        }
        return matrix;
    }

    public static int[][] multiplyMatrices(int[][] A, int[][] B) {
        int n = A.length;
        int[][] C = new int[n][n];

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                for (int k = 0; k < n; k++) {
                    C[i][j] += A[i][k] * B[k][j];
                }
            }
        }
        return C;
    }

    public static void benchmark(int n) {
        int[][] A = generateMatrix(n);
        int[][] B = generateMatrix(n);

        long start = System.nanoTime();
        int[][] C = multiplyMatrices(A, B);
        long end = System.nanoTime();

        double elapsedMs = (end - start) / 1_000_000.0;
        System.out.printf("Tiempo de ejecución: %.3f ms\n", elapsedMs);
        System.out.printf("Tamaño de la matriz resultante: %d x %d\n", C.length, C[0].length);
    }

    public static void main(String[] args) {
        int n = (args.length > 0) ? Integer.parseInt(args[0]) : 300;
        benchmark(n);
    }
}

