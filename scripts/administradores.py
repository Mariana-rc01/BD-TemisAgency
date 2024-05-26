import random
import unidecode


def administradores(count_administradores):
    output_buffer = ""

    nomes_portugal = open("data/nomes.csv", encoding="utf8").read().split("\n")

    sobrenomes_portugal = open("data/apelidos.csv", encoding="utf8").read().split("\n")

    telefones_administrador = []
    emails_administrador = []
    output_buffer += "INSERT INTO Administrador (Id, Nome, DataNascimento) \nVALUES"
    for i in range(0, count_administradores):
        nome_cliente = (random.choice(nomes_portugal) + " " + random.choice(sobrenomes_portugal)).replace("'", "")
        data_nascimento_administrador = "19" + str(random.randint(70, 99)) + "-" + str(random.randint(1, 12)).zfill(
            2) + "-" + str(random.randint(1, 28)).zfill(2)

        email_domain = "temis.gr"
        emails_administrador.append((i, ("{}@" + email_domain).format(
            unidecode.unidecode(nome_cliente).lower().replace(" ", "_") + str(random.randint(0, 99)))))
        telefones_administrador.append((i, "+3519" + "".join([str(random.randint(0, 9)) for _ in range(8)])))

        output_buffer += f"({i},'{nome_cliente}', '{data_nascimento_administrador}')" + (
            "," if i < count_administradores - 1 else ";")

    output_buffer += "\nINSERT INTO AdministradorTelefones (Administrador, Telefone) \nVALUES"
    for i in range(0, count_administradores):
        output_buffer += f"{telefones_administrador[i]}" + ("," if i < count_administradores - 1 else ";")

    output_buffer += "\nINSERT INTO AdministradorEmails (Administrador, Email) \nVALUES"
    for i in range(0, count_administradores):
        output_buffer += f"{emails_administrador[i]}" + ("," if i < count_administradores - 1 else ";")

    return output_buffer
