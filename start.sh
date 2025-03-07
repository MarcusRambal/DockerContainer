#!/bin/bash

if [ -z "$1" ]; then
    echo "Uso: $0 <archivo_fuente>"
    exit 1
fi

# Definir la ruta del archivo dentro de la carpeta 'lenguajes/'
archivo="lenguajes/$1"

# Verificar si el archivo existe
if [ ! -f "$archivo" ]; then
    echo "Error: El archivo '$archivo' no existe en la carpeta 'lenguajes/'."
    exit 1
fi

# Obtener la extensión (.java, .js... etc) del archivo para determinar el lenguaje
extension="${archivo##*.}"

#Casos para cada lenguaje

case "$extension" in
    py)
        lenguaje="python"
        comando="python /codigo/$archivo"
        ;;
    java)
        lenguaje="openjdk"
        nombre_clase="${1%}" 
        comando="sh -c '
            javac /codigo/$archivo || { echo \"Error en la compilación\"; exit 1; }
            java -cp /codigo/lenguajes Solucion
        '"
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

# Ejecutar el código dentro de un contenedor Docker con el lenguaje correspondiente
salida=$(docker run --rm -v "$(pwd)":/codigo -w /codigo $lenguaje bash -c "$comando")

# Salida
echo "Salida del programa:"
echo "$salida"
