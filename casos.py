import random


def casos(count_casos, count_clientes):
    output_buffer = ""

    # Especializações de crimes
    especializacoes_crimes = ["Homicídio", "Roubo", "Furto", "Burla", "Tráfico", "Violência doméstica", "Assédio",
                              "Sequestro"]

    output_buffer += "\n-- ESPECIALIZAÇÕES\n"

    output_buffer += "INSERT INTO Especialização (id, designação) \nVALUES"
    for i in range(0, len(especializacoes_crimes)):
        output_buffer += f"({i},'{especializacoes_crimes[i]}')" + (
            "," if i < len(especializacoes_crimes) - 1 else ";")

    output_buffer += "\n-- PAGAMENTOS\n"

    datas_pagamentos = []

    # Pagamentos
    output_buffer += "\nINSERT INTO Pagamento (Id, Valor, Método, DataPagamento) \nVALUES"
    for i in range(0, count_casos):
        valor = random.randint(800, 4000)
        metodo = random.choice(["Cartão de Crédito", "Transferência bancária", "Dinheiro", "Cheque"])
        data_pagamento = f"20{random.randint(10, 21)}-{str(random.randint(1, 12)).zfill(2)}-{str(random.randint(1, 28)).zfill(2)}"
        datas_pagamentos.append(data_pagamento)
        output_buffer += f"({i}, {valor}, '{metodo}', '{data_pagamento}')" + (
            "," if i < count_casos - 1 else ";")

    output_buffer += "\n-- CASOS\n"

    # Casos
    output_buffer += "\nINSERT INTO Caso (Id, DataInício, DataFim, Estado, Especialização, Cliente, Pagamento) \nVALUES"
    for i in range(0, count_casos):
        estado = random.choice([0, 1])
        data_inicio = datas_pagamentos[i]
        if estado == 1:
            data_fim = f"20{random.randint(10, 21)}-{str(random.randint(1, 12)).zfill(2)}-{str(random.randint(1, 28)).zfill(2)}"
            while data_fim <= data_inicio:
                data_fim = f"20{random.randint(10, 21)}-{str(random.randint(1, 12)).zfill(2)}-{str(random.randint(1, 28)).zfill(2)}"
        else:
            data_fim = "NULL"
        especializacao = random.randint(0, len(especializacoes_crimes) - 1)
        cliente = random.randint(0, count_clientes - 1)
        pagamento = i

        if data_fim != "NULL":
            data_fim = f"'{data_fim}'"

        output_buffer += f"({i},'{data_inicio}', {data_fim}, {estado}, {especializacao}, {cliente}, {pagamento})" + (
            "," if i < count_casos - 1 else ";")

    return output_buffer
