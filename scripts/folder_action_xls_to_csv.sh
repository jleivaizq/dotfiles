#!/bin/zsh

LOGFILE="$HOME/convert_xls_to_csv.log"

echo "Script ejecutado en $(date)" >> "$LOGFILE"

echo "Archivos recibidos: $@" >> "$LOGFILE"

# Usa find y xargs para manejar los archivos pasados
#find "$HOME/Downloads" -type f \( -name "*.xls" -o -name "*.xlsx" \) | while read -r f; do
for f in "$@"; do
    echo "Procesando archivo: $f" >> "$LOGFILE"

    # Verifica si el archivo es .xls o .xlsx
    extension="${f##*.}"
    echo "Extensión del archivo: $extension" >> "$LOGFILE"

    if [[ "$extension" == "xls" || "$extension" == "xlsx" ]]; then
        # Extrae el nombre base del archivo sin la extensión
        base_name=$(basename "$f" .$extension)
        echo "Nombre base del archivo: $base_name" >> "$LOGFILE"
        
        # Define la ruta de salida para el archivo CSV
        output_file="$HOME/Downloads/${base_name}.csv"
        echo "Archivo de salida: $output_file" >> "$LOGFILE"
        
        # Ejecuta el script de Python con los parámetros de entrada
        /usr/local/bin/python3 ~/scripts/convert_xls_to_csv.py "$f" "$output_file" >> "$LOGFILE" 2>&1
        echo "Conversión completada para $f" >> "$LOGFILE"
    else
        echo "Archivo no compatible: $f" >> "$LOGFILE"
    fi
done
echo "Script finalizado" >> "$LOGFILE"
