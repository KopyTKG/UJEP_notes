import matplotlib.pyplot as plt

veta_cz = "Pes na kole jel a stekal na postaka."
veta_cz = veta_cz.lower().replace(".", "")

slovniky = {
    "ang": {
        "pes":"dog",
        "na": "on",
        "stekal": "barked",
        "postaka": "postman",
    },
    "ger": {
        "pes": "hund",
        "na": "unter",
        "stekal": "bellte",
        "postaka": "postbote",
    },
    "it": {
        "pes": "cane",
        "na": "a",
        "stekal": "abbaiato",
        "postaka": "postino",
    }
}

for key in slovniky.keys():
    prelozena_veta = ""    
    for slovo in veta_cz.split():
        if slovo in slovniky[key]: #.keys()
            prelozena_veta += slovniky[key][slovo] + " "
        else:
            prelozena_veta += slovo + " "

    print(prelozena_veta)

