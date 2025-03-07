# DockerContainer

#Benchmark 
El objetivo es hacer una prueba de tiempo de ejecucion utilizando diferentes lenguajes de programacion, para ello levantamos contenedores en docker donde se prepara el entorno para la ejecucion del script en su lenguaje correspondiente, se generan matrices de nxn en este caso (300x300) con valores aletorios entre 0 y 9, en cada script se multiplican las matrices con una complejidad O(n^3), usando 3 bucles anidados.


- git clone https://github.com/MarcusRambal/DockerContainer.git

- cd DockerContainer

- chmod +x start.sh

Para correr el archivo:

- ./start.sh main.'extension'

Ejemplo:

./start.sh main.py

./start.sh main.js

./start.sh main.rb

./start.sh main.cpp

./start.sh Solucion.java
