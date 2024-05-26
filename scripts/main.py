from administradores import administradores
from armazens import armazens, armazens_administradores
from casos import casos
from clientes import clientes
from detetives import detetives
from objetos import objetos
from pagamentoAdministrador import pagamento_administrador
from casoAdministrador import caso_administrador
from detetiveCaso import detetive_caso
from detetiveAdministrador import detetive_administrador

file = open("povoamento.sql", "w", encoding="utf-8")

'''count_detetives = 505
count_clientes = 2000
count_armazens = 15
count_casos = 3000
count_objetos = 1000
count_administradores = 55'''

count_detetives = 15
count_clientes = 30
count_armazens = 4
count_casos = 31
count_objetos = 12
count_administradores = 10

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
          "\n -- DETETIVE ADMINISTRADOR\n" +
          detetive_administrador(count_detetives, count_administradores) +
          # CasoArquivo
          # CasoArquivoAnexo
          "\n -- DETETIVE CASO\n" +
          detetive_caso(count_casos, count_detetives) +
          caso_administrador(count_casos, count_administradores))

file.write(output)
