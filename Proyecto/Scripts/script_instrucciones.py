nombre_archivo = 'rom.mif'
linea_objetivo = 25
lineas = []

instrucciones_sepia = ["e3a00000",
                        "e3091c40",
                        "e3092c40",
                        "e5903000",
                        "e20340ff",
                        "e2035cff",
                        "e1a05425",
                        "e20368ff",
                        "e1a06826",
                        "e3007189",
                        "e0070697",
                        "e3008301",
                        "e0080598",
                        "e0877008",
                        "e3a080bd",
                        "e0080498",
                        "e0877008",
                        "e1a07527",
                        "e35700ff",
                        "83a070ff",
                        "e300815d",
                        "e0080698",
                        "e30092ae",
                        "e0090599",
                        "e0888009",
                        "e3a090a8",
                        "e0090499",
                        "e0888009",
                        "e1a08528",
                        "e35800ff",
                        "83a080ff",
                        "e3a09e11",
                        "e0090699",
                        "e300a216",
                        "e00a059a",
                        "e089900a",
                        "e3a0a083",
                        "e00a049a",
                        "e089900a",
                        "e1a09529",
                        "e35900ff",
                        "83a090ff",
                        "e1a07807",
                        "e1a08408",
                        "e1877008",
                        "e1877009",
                        "e5817000",
                        "e2800001",
                        "e2811001",
                        "e2522001",
                        "1affffcf",
                        "eafffffe"]


with open(nombre_archivo, 'r') as archivo:
        lineas = archivo.readlines()[0:24]
        
count = 0
longitud = len(instrucciones_sepia)
if 1 <= linea_objetivo <= len(lineas) + 1:
    for i in range(longitud):
        linea = f'\t{count} : {instrucciones_sepia[i]};\n\t[{count+1}..{count+3}] : 0;\n'
        lineas.insert(linea_objetivo + count - 1, linea)
        count += 4
    lineas.insert(linea_objetivo + count, f'\t[{count}..{255}] : 0;\n')
    lineas.insert(linea_objetivo + count + 1, "END;")

with open(nombre_archivo, 'w') as archivo:
    archivo.writelines(lineas)

print(f'Los valores de instrucciones se han guardado en {nombre_archivo}')
