from administradores import administradores
from armazens import armazens, armazens_administradores
from casos import casos
from clientes import clientes
from detetives import detetives
from objetos import objetos
from pagamentoAdministrador import pagamento_administrador
from casoAdministrador import caso_administrador

file = open("povoamento.sql", "w", encoding="utf-8")

count_detetives = 505
count_clientes = 2000
count_armazens = 15
count_casos = 3000
count_objetos = 1000
count_administradores = 55

output = ("USE temis_db;\n" +
          "-- DETETIVES\n" +
          detetives(count_detetives) +
          "\n-- CLIENTES\n" +
          clientes(count_clientes) +
          "\n-- ARMAZÉNS\n" +
          armazens(count_armazens) +
          casos(count_casos, count_clientes) +
          objetos(count_objetos, count_armazens, count_casos) +
          "\n-- ADMINISTRADORES\n" +
          administradores(count_administradores) +
          "\n-- ADMINISTRADOR ARMAZÉNS\n" +
          armazens_administradores(count_armazens, count_administradores) +
          pagamento_administrador(count_casos, count_administradores) +
          # DetetiveAdministrador
          # CasoArquivo
          # CasoArquivoAnexo
          # DetetiveCaso
          caso_administrador(count_casos, count_administradores))

file.write(output)
