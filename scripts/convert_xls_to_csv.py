import pandas as pd
import sys
import os

def xls_to_csv(input_file, output_file):
    # Identificar la extensión del archivo
    file_extension = os.path.splitext(input_file)[1]
    
    # Seleccionar el motor adecuado
    if file_extension == '.xls':
        df = pd.read_excel(input_file, engine='xlrd')
    elif file_extension == '.xlsx':
        df = pd.read_excel(input_file, engine='openpyxl')
    else:
        raise ValueError("El archivo debe ser un .xls o .xlsx")

    # Guardar el DataFrame en un archivo CSV
    df.to_csv(output_file, index=False)

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Uso: python convert_xls_to_csv.py <input_file> <output_file>")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    
    # Verifica si el archivo de entrada existe
    if not os.path.exists(input_file):
        print(f"El archivo {input_file} no existe.")
        sys.exit(1)
    
    xls_to_csv(input_file, output_file)
    print(f"Archivo convertido y guardado como {output_file}")
