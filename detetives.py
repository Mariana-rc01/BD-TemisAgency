import random
import requests
import unidecode


def detetives(count_detetives):
    output_buffer = ""

    nomes_portugal = requests.get(
        "https://raw.githubusercontent.com/centraldedados/gerador-nomes/master/data/nomes.csv").content.decode(
        "utf-8").split("\n")

    sobrenomes_portugal = requests.get("https://raw.githubusercontent.com/centraldedados/gerador-nomes/master/data"
                                       "/apelidos.csv").content.decode("utf-8").split("\n")

    telefones_detetive = []
    emails_detetive = []
    output_buffer += "INSERT INTO Detetive (id, nome, dataNascimento) \nVALUES"
    for i in range(0, count_detetives):
        nome_detetive = (random.choice(nomes_portugal) + " " + random.choice(sobrenomes_portugal)).replace("'", "")
        data_nascimento_detetive = "19" + str(random.randint(70, 99)) + "-" + str(random.randint(1, 12)).zfill(
            2) + "-" + str(random.randint(1, 28)).zfill(2)

        email_domain = "temis.gr"
        emails_detetive.append((i, ("{}@" + email_domain).format(
            unidecode.unidecode(nome_detetive).lower().replace(" ", "_") + str(random.randint(0, 99)))))
        telefones_detetive.append((i, "+3519" + "".join([str(random.randint(0, 9)) for _ in range(8)])))

        output_buffer += f"({i},'{nome_detetive}', '{data_nascimento_detetive}')" + (
            "," if i < count_detetives - 1 else ";")

    output_buffer += "\nINSERT INTO DetetiveTelefones (detetive, telefone) \nVALUES"
    for i in range(0, count_detetives):
        output_buffer += f"{telefones_detetive[i]}" + ("," if i < count_detetives - 1 else ";")

    output_buffer += "\nINSERT INTO DetetiveEmails (detetive, email) \nVALUES"
    for i in range(0, count_detetives):
        output_buffer += f"{emails_detetive[i]}" + ("," if i < count_detetives - 1 else ";")

    return output_buffer
