import random

def caso_administrador(num_casos, num_administradores):

    output_buffer = ""

    output_buffer += "\nINSERT INTO CasoAdministrador (Caso, Administrador) \nVALUES"
    for i in range(num_casos):
        administrador = random.randint(0, num_administradores - 1)
        output_buffer += f"({i}, {administrador})" + ("," if i < num_casos - 1 else ";")

    return output_buffer