#!/bin/bash

if [ -z "$1" ]; then
    echo "Uso: $0 <archivo_fuente>"
    exit 1
fi

archivo="lenguaje/$1" 

if [ ! -f "$archivo" ]; then
    echo "Error: El archivo '$archivo' no existe en la carpeta 'lenguaje/'."
    exit 1
fi


extension="${archivo##*.}"

case "$extension" in
    py)
        lenguaje="python"
        comando="time -p python /codigo/$archivo"
        ;;
    java)
        lenguaje="openjdk"
        comando="sh -c 'javac /codigo/$archivo && time -p java -cp /codigo Main'"
        ;;
    cpp|cc)
        lenguaje="gcc"
        comando="sh -c 'g++ /codigo/$archivo -o /codigo/programa && time -p /codigo/programa'"
        ;;
    js)
        lenguaje="node"
        comando="time -p node /codigo/$archivo"
        ;;
    rb)
        lenguaje="ruby"
        comando="time -p ruby /codigo/$archivo"
        ;;
    *)
        echo "Error: Extensión no soportada."
        exit 1
        ;;
esac

echo "Ejecutando $archivo en un contenedor de $lenguaje..."

salida=$(docker run --rm -v "$(pwd)":/codigo -w /codigo $lenguaje bash -c "$comando" 2>&1)


tiempo=$(echo "$salida" | grep "real" | awk '{print $2}')
salida_sin_tiempo=$(echo "$salida" | grep -v "real")


echo "Salida del programa:"
echo "$salida_sin_tiempo"

if [ -z "$tiempo" ]; then
    echo "Error al obtener el tiempo de ejecución."
else
    echo "Tiempo de ejecución: ${tiempo}s"
fi
