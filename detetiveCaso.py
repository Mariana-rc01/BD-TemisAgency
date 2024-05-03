import random

def detetive_caso(num_casos, num_detetives):

    output_buffer = ""

    output_buffer += "\nINSERT INTO DetetiveCaso (Detetive, Caso) \nVALUES"
    for i in range(num_casos):
        detetive = random.randint(0, num_detetives - 1)
        output_buffer += f"({detetive}, {i})" + ("," if i < num_casos - 1 else ";")

    return output_buffer
