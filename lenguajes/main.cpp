#include <iostream>
#include <chrono>

int main() {
    auto start = std::chrono::high_resolution_clock::now();

    std::cout << "Hola, mundo!" << std::endl;

    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = end - start;

    std::cout << "Tiempo de ejecución: " << elapsed.count() << "s" << std::endl;
    return 0;
}
