from PIL import Image

def escala_gris(image_path: str) -> Image:
    # Cargar la imagen
    img = Image.open(image_path)
    width, height = img.size
    pixels = img.load()

    # Procesar cada píxel para calcular el valor promedio de RGB
    for y in range(height):
        for x in range(width):
            r, g, b = img.getpixel((x, y))
            # Calcular el valor de gris como promedio de los tres canales
            gray = int((r + g + b) / 3)
            # Asignar el nuevo valor de gris al píxel
            pixels[x, y] = (gray, gray, gray)

    return img

# Cargar y convertir a escala de grises 'image.jpg'
imagen_gris = escala_gris("image.jpg")

# Mostrar la imagen en escala de grises
imagen_gris.show()
