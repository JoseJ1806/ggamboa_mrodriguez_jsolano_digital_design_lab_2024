from PIL import Image

def apply_sepia(image_path: str) -> Image:
    # Cargar la imagen
    img = Image.open(image_path)
    width, height = img.size
    pixels = img.load()

    # Aplicar el filtro sepia
    for y in range(height):
        for x in range(width):
            r, g, b = img.getpixel((x, y))

            # Cálculo de los nuevos valores RGB
            tr = int(0.393 * r + 0.769 * g + 0.189 * b)
            tg = int(0.349 * r + 0.686 * g + 0.168 * b)
            tb = int(0.272 * r + 0.534 * g + 0.131 * b)

            # Asegurar que los valores estén en el rango [0, 255]
            tr = min(255, tr)
            tg = min(255, tg)
            tb = min(255, tb)

            # Asignar el nuevo color al píxel
            pixels[x, y] = (tr, tg, tb)

    return img

# Cargar y aplicar el filtro sepia a 'image.jpg'
sepia_image = apply_sepia("image.jpg")

# Mostrar la imagen con el filtro sepia
sepia_image.show()
