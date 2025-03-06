#!/bin/bash

if [ -z "$1" ]; then
    echo "Uso: $0 <archivo_fuente>"
    exit 1
fi

archivo="lenguajes/$1"

if [ ! -f "$archivo" ]; then
    echo "Error: El archivo '$archivo' no existe en la carpeta 'lenguajes/'."
    exit 1
fi

extension="${archivo##*.}"

case "$extension" in
    py)
        lenguaje="python"
        comando="python /codigo/$archivo"
        ;;
    java)
        lenguaje="openjdk"
        nombre_clase="${1%}" 
        comando="sh -c 'javac /codigo/$archivo && java -cp /codigo $nombre_clase'"
        ;;
    cpp|cc)
        lenguaje="gcc"
        comando="sh -c 'g++ /codigo/$archivo -o /codigo/programa && /codigo/programa'"
        ;;
    js)
        lenguaje="node"
        comando="node /codigo/$archivo"
        ;;
    rb)
        lenguaje="ruby"
        comando="ruby /codigo/$archivo"
        ;;
    *)
        echo "Error: Extensión no soportada."
        exit 1
        ;;
esac

echo "Ejecutando $archivo en un contenedor de $lenguaje..."

salida=$(docker run --rm -v "$(pwd)":/codigo -w /codigo $lenguaje bash -c "$comando")

echo "Salida del programa:"
echo "$salida"
