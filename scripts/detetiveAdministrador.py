import random

def detetive_administrador(num_detetives, num_administradores):

    output_buffer = ""

    output_buffer += "\nINSERT INTO DetetiveAdministrador (Detetive, Administrador) \nVALUES"
    for i in range(num_detetives):
        administrador = random.randint(0, num_administradores - 1)
        output_buffer += f"({i}, {administrador})" + ("," if i < num_detetives - 1 else ";")

    return output_buffer
