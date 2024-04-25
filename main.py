from armazens import armazens
from casos import casos
from clientes import clientes
from detetives import detetives
from objetos import objetos

file = open("povoamento.sql", "w", encoding="utf-8")

count_detetives = 505
count_clientes = 2000
count_armazens = 15
count_casos = 3000
count_objetos = 1000

output = ("USE temis_db;\n" +
          "-- DETETIVES\n" +
          detetives(count_detetives) +
          "\n-- CLIENTES\n" +
          clientes(count_clientes) +
          "\n-- ARMAZÉNS\n" +
          armazens(count_armazens) +
          casos(count_casos, count_clientes) +
          objetos(count_objetos, count_armazens, count_casos))

file.write(output)
