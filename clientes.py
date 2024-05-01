import random
import unidecode


def clientes(count_clientes):
    output_buffer = ""

    nomes_portugal = open("data/nomes.csv", encoding="utf8").read().split("\n")

    sobrenomes_portugal = open("data/apelidos.csv", encoding="utf8").read().split("\n")

    telefones_cliente = []
    emails_cliente = []
    output_buffer += "INSERT INTO Cliente (Id, Nome) \nVALUES"
    for i in range(0, count_clientes):
        nome_cliente = (random.choice(nomes_portugal) + " " + random.choice(sobrenomes_portugal)).replace("'", "")

        email_domain = random.choice(
            ["gmail.com", "hotmail.com", "outlook.com", "sapo.pt", "mail.pt", "live.com", "yahoo.com", "icloud.com"])
        emails_cliente.append((i, ("{}@" + email_domain).format(
            unidecode.unidecode(nome_cliente).lower().replace(" ", "_") + str(random.randint(0, 99)))))
        telefones_cliente.append((i, "+3519" + "".join([str(random.randint(0, 9)) for _ in range(8)])))

        output_buffer += f"({i},'{nome_cliente}')" + (
            "," if i < count_clientes - 1 else ";")

    output_buffer += "\nINSERT INTO ClienteTelefones (Cliente, Telefone) \nVALUES"
    for i in range(0, count_clientes):
        output_buffer += f"{telefones_cliente[i]}" + ("," if i < count_clientes - 1 else ";")

    output_buffer += "\nINSERT INTO ClienteEmails (Cliente, Email) \nVALUES"
    for i in range(0, count_clientes):
        output_buffer += f"{emails_cliente[i]}" + ("," if i < count_clientes - 1 else ";")

    return output_buffer
