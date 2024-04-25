import random

addresses = [
    # Portugal
    {"rua": "Rua da Praia", "localidade": "Albufeira", "código postal": "8200-002"},
    {"rua": "Rua do Comércio", "localidade": "Lisboa", "código postal": "1100-150"},
    {"rua": "Rua do Carmo", "localidade": "Porto", "código postal": "4050-164"},
    {"rua": "Rua Augusta", "localidade": "Lisboa", "código postal": "1100-048"},
    {"rua": "Rua de Santa Catarina", "localidade": "Porto", "código postal": "4000-447"},
    {"rua": "Rua da Boavista", "localidade": "Lisboa", "código postal": "1200-062"},
    {"rua": "Rua Mouzinho da Silveira", "localidade": "Porto", "código postal": "4050-415"},
    {"rua": "Rua dos Douradores", "localidade": "Lisboa", "código postal": "1100-206"},
    {"rua": "Rua de Cedofeita", "localidade": "Porto", "código postal": "4050-180"},
    {"rua": "Rua das Flores", "localidade": "Lisboa", "código postal": "1200-195"},
    # Spain
    {"rua": "Calle Mayor", "localidade": "Madrid", "código postal": "28013"},
    {"rua": "Calle Gran Vía", "localidade": "Barcelona", "código postal": "08002"},
    {"rua": "Calle de la Paz", "localidade": "Valencia", "código postal": "46003"},
    {"rua": "Carrer del Bisbe", "localidade": "Girona", "código postal": "17004"},
    {"rua": "Calle Serrano", "localidade": "Madrid", "código postal": "28001"},
    {"rua": "Avenida de la Constitución", "localidade": "Sevilla", "código postal": "41001"},
    {"rua": "Calle Larios", "localidade": "Málaga", "código postal": "29005"},
    {"rua": "Carrer del Comte d'Urgell", "localidade": "Tarragona", "código postal": "43001"},
    {"rua": "Calle Mayor", "localidade": "Bilbao", "código postal": "48001"},
    {"rua": "Avinguda Diagonal", "localidade": "Barcelona", "código postal": "08019"},
    # Italy
    {"rua": "Via del Corso", "localidade": "Rome", "código postal": "00186"},
    {"rua": "Via dei Condotti", "localidade": "Rome", "código postal": "00187"},
    {"rua": "Corso Vittorio Emanuele II", "localidade": "Milan", "código postal": "20121"},
    {"rua": "Via Monte Napoleone", "localidade": "Milan", "código postal": "20121"},
    {"rua": "Via Roma", "localidade": "Turin", "código postal": "10121"},
    {"rua": "Piazza di Spagna", "localidade": "Rome", "código postal": "00187"},
    {"rua": "Via Veneto", "localidade": "Rome", "código postal": "00187"},
    {"rua": "Via Condotti", "localidade": "Rome", "código postal": "00187"},
    {"rua": "Via Garibaldi", "localidade": "Genoa", "código postal": "16124"},
    {"rua": "Corso Buenos Aires", "localidade": "Milan", "código postal": "20124"},
    # Greece
    {"rua": "Οδός Αθανασίου Διάκου", "localidade": "Athens", "código postal": "106 76"},
    {"rua": "Οδός Σταδίου", "localidade": "Athens", "código postal": "105 62"},
    {"rua": "Οδός Ερμού", "localidade": "Athens", "código postal": "105 63"},
    {"rua": "Οδός Πλαπούτα", "localidade": "Athens", "código postal": "105 57"},
    {"rua": "Οδός Κολοκοτρώνη", "localidade": "Thessaloniki", "código postal": "546 23"},
    {"rua": "Οδός Αριστοτέλους", "localidade": "Thessaloniki", "código postal": "546 23"},
    {"rua": "Οδός Τσιμισκή", "localidade": "Thessaloniki", "código postal": "546 22"},
    {"rua": "Οδός Πλατείας Αριστοτέλους", "localidade": "Thessaloniki", "código postal": "546 21"},
    {"rua": "Οδός Αγίου Δημητρίου", "localidade": "Patras", "código postal": "262 21"},
    {"rua": "Οδός Ρήγα Φεραίου", "localidade": "Patras", "código postal": "262 22"},

    # France
    {"rua": "Rue de Rivoli", "localidade": "Paris", "código postal": "75001"},
    {"rua": "Avenue des Champs-Élysées", "localidade": "Paris", "código postal": "75008"},
    {"rua": "Boulevard Haussmann", "localidade": "Paris", "código postal": "75009"},
    {"rua": "Rue du Faubourg Saint-Honoré", "localidade": "Paris", "código postal": "75008"},
    {"rua": "Avenue Montaigne", "localidade": "Paris", "código postal": "75008"}
]


def armazens(count_armazens):
    output_buffer = ""
    output_buffer += "INSERT INTO Armazém (Id, Descrição, Lotação, Rua, Localidade, CódigoPostal) \nVALUES"
    for i in range(0, count_armazens):
        local = random.choice(addresses)
        local["localidade"] = local["localidade"].replace("'", "")
        local["rua"] = local["rua"].replace("'", "")
        addresses.remove(local)
        output_buffer += f"({i}, 'Armazém {i + 1}', {random.randint(100, 1000)}, '{local['rua']}', '{local['localidade']}', '{local['código postal']}')" + ( "," if i < count_armazens - 1 else ";")
    return output_buffer