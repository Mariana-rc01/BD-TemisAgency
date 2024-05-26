import random

arquivo_template = [
    ["Relatório de investigação", "Relatório de investigação sobre o caso", ["relatorio.pdf", "investigacao.docx"]],
    ["Grelha de análise", "Grelha de análise de evidências", ["grelha.pdf", "analise.docx"]],
    ["Fotografias", "Fotografias de evidências", ["01.png", "02.jpeg", "03.jpg", "04.png", "05.jpeg", "06.jpg"]],
    ["Vídeos", "Vídeos de evidências", ["captura.mp4", "video.mp4"]],
    ["Áudio de chamada", "Áudio de chamada de evidências", ["escuta.wav", "captura.mp3", "chamada.mp3"]],
    ["Áudio de interrogatório", "Áudio de interrogatório de evidências", ["escuta.wav", "captura.mp3"]],
    ["Áudio de escuta", "Áudio de escuta", ["escuta.wav", "captura.mp3"]]
]


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
            data_fim = ""
            while data_fim < data_inicio:
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

    # Caso Arquivos

    output_buffer += "\n-- CASO_ARQUIVOS\n"
    arquivo_id = 0
    arquivos = []
    output_buffer += f"\nINSERT INTO CasoArquivo (Id, Título, DataAdição, Descrição, Caso) \nVALUES"
    for i in range(0, count_casos):
        range_arquivos = random.randint(1, 3)
        for j in range(range_arquivos):
            arquivo = random.choice(arquivo_template)
            arquivos.append(arquivo)
            output_buffer += f"({arquivo_id}, '{arquivo[0]}', '{datas_pagamentos[i]}', '{arquivo[1]}', {i})" + (
                ";" if (i == count_casos - 1 and j == range_arquivos - 1) else ",")
            arquivo_id += 1

    # Caso Arquivo Anexo
    output_buffer += "\n-- CASO ARQUIVO ANEXO\n"
    anexo_id = 0
    output_buffer += f"\nINSERT INTO CasoArquivoAnexo (Id, Anexo, Arquivo) \nVALUES"
    for i in range(0, arquivo_id):
        count_anexo_arquivos = random.randint(1, 2)
        for j in range(count_anexo_arquivos):
            anexo = random.choice(arquivos[i][2])
            output_buffer += f"({anexo_id}, '{anexo}', {i})" + (
                ";" if (i == arquivo_id - 1 and j == count_anexo_arquivos - 1) else ",")
            anexo_id += 1

    return output_buffer