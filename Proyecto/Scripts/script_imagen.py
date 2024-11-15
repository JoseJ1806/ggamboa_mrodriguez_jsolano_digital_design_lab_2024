import cv2

# Carga la imagen en color (escala RGB)
imagen = cv2.imread('Mario.jpg', cv2.IMREAD_COLOR)

nombre_archivo = 'pixeles_rgb.mif'
linea_objetivo = 25
lineas = []

count = 0

if imagen is not None:
    alto, ancho, _ = imagen.shape  # Se obtiene también el número de canales (3: R, G, B)

    # Leer el archivo MIF existente (si existe)
    with open(nombre_archivo, 'r') as archivo:
        lineas = archivo.readlines()[0:24]
        lineas.append("END;")  # Agregar el final del archivo MIF

    # Si la línea objetivo es válida, insertar los píxeles
    if 1 <= linea_objetivo <= len(lineas) + 1:
        for y in range(alto):
            for x in range(ancho):
                # Extrae los valores RGB de cada píxel (OpenCV usa BGR)
                b, g, r = imagen[y, x]  
                # Convierte los valores RGB a hexadecimal
                hex_color = '{:02X}{:02X}{:02X}'.format(r, g, b)  # Formato hexadecimal (R, G, B)

                # Inserta en la línea MIF en formato adecuado
                linea = f'\t{count} : {hex_color};\n'  # Almacena en formato hexadecimal
                lineas.insert(linea_objetivo + count - 1, linea)
                count += 1

    # Guardar los cambios en el archivo MIF
    with open(nombre_archivo, 'w') as archivo:
        archivo.writelines(lineas)

    print(f'Los valores de píxeles se han guardado en {nombre_archivo}')
    print(f'Dimensión de la imagen: {alto} x {ancho}')   

    cv2.destroyAllWindows()
else:
    print('No se pudo cargar la imagen.')
