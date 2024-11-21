nombre_archivo = 'rom.mif'
linea_objetivo = 25
lineas = []

instrucciones_sepia = ["e3a00000",
                        "e3a010ff",
                        "e3092c40",
                        "e5903000",
                        "e20340ff",
                        "e2035cff",
                        "e1a05425",
                        "e20368ff",
                        "e1a06826",
                        "e3007189",
                        "e0077796",
                        "e3008301",
                        "e0088895",
                        "e0877008",
                        "e3a080bd",
                        "e0088894",
                        "e0877008",
                        "e1a07527",
                        "e1570001",
                        "81a77001",
                        "e300815d",
                        "e0088698",
                        "e30092ae",
                        "e0099995",
                        "e0888009",
                        "e3a090a8",
                        "e0099994",
                        "e0888009",
                        "e1a08528",
                        "e1580001",
                        "81a88001",
                        "e3a09e11",
                        "e0099699",
                        "e300a216",
                        "e00aaa95",
                        "e089900a",
                        "e3a0a083",
                        "e00aaa94",
                        "e089900a",
                        "e1a09529",
                        "e1590001",
                        "81a99001",
                        "e1a07807",
                        "e1a08408",
                        "e1877008",
                        "e1877009",
                        "e5807000",
                        "e2800001",
                        "e2522001",
                        "1affffd0",
                        "eafffffe"]

filtro_grises = [
                "e3a00000",
                "e3a010ff",
                "e3092c40",
                "e5903000",
                "e20340ff",
                "e2035cff",
                "e1a05425",
                "e20368ff",
                "e1a06826",
                "e0867005",
                "e0877004",
                "e1a07127",
                "e1570001",
                "81a77001",
                "e1a08807",
                "e1a09407",
                "e1888009",
                "e1888007",
                "e5818000",
                "e2800001",
                "e2522001",
                "1affffec",
                "eafffffe"]


with open(nombre_archivo, 'r') as archivo:
        lineas = archivo.readlines()[0:24]
        
count = 0
longitud = len(filtro_grises)
if 1 <= linea_objetivo <= len(lineas) + 1:
    for i in range(longitud):
        linea = f'\t{count} : {filtro_grises[i]};\n\t[{count+1}..{count+3}] : 0;\n'
        lineas.insert(linea_objetivo + count - 1, linea)
        count += 4
    lineas.insert(linea_objetivo + count, f'\t[{count}..{255}] : 0;\n')
    lineas.insert(linea_objetivo + count + 1, "END;")

with open(nombre_archivo, 'w') as archivo:
    archivo.writelines(lineas)

print(f'Los valores de instrucciones se han guardado en {nombre_archivo}')
