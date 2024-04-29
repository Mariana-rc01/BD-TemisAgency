import random

def pagamento_administrador(num_pagamentos, num_administradores):

    output_buffer = ""

    output_buffer += "\nINSERT INTO PagamentoAdministrador (Pagamento, Administrador) \nVALUES"
    for i in range(num_pagamentos):
        administrador = random.randint(0, num_administradores - 1)
        output_buffer += f"({i}, {administrador})" + ("," if i < num_pagamentos - 1 else ";")

    return output_buffer