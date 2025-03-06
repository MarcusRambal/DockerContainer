public class Main {
    public static void main(String[] args) {
        long startTime = System.nanoTime();

        System.out.println("Hola, mundo!");

        long endTime = System.nanoTime();
        double elapsedTime = (endTime - startTime) / 1_000_000_000.0;
        System.out.println("Tiempo de ejecución: " + elapsedTime + "s");
    }
}
