import string



def seznam(text):
    velka_pismena = []
    for pismeno in text:
        if pismeno in string.ascii_uppercase:
            velka_pismena.append(pismeno)
    return velka_pismena




def Print(itemset):
    for row in itemset:
        rowstring = " "
        for item in row:
            rowstring += f"{item} " 
        print(rowstring)



def triangle(limit, step):
    rows = []
    if step <= -1:
        for row in range(limit, 0, step):
            rowstr = ""
            for item in range(row):
                rowstr += "*"
            for _ in range(limit -row):
                rowstr += " "
            rows.append(rowstr)

    elif step >= 1: 
        for row in range(0,limit, step):
            rowstr = ""
            for item in range(row):
                rowstr += "*"
            for _ in range(limit -row):
                rowstr += " "
            rows.append(rowstr)
    return rows

def rev_triangle(limit, step):
    rows = []
    if step <= -1:
        for row in range(limit, 0, step):
            rowstr = ""
            for _ in range((limit-row)):
                rowstr += " "

            for item in range(row):
                rowstr += "*"
            rows.append(rowstr)

    elif step >= 1:
        for row in range(0,limit, step):
            rowstr = ""
            for _ in range((limit-row)):
                rowstr += " "

            for item in range(row):
                rowstr += "*"
            rows.append(rowstr)
    return rows
        

def get_index(seznam, znak):
    for index in range(len(seznam)):
        if seznam[index] == znak:
            print(index)
            return index


def __main():
    tmp = ["A","B","C","G","F"]

    print(tmp.index("G"))
    get_index(tmp, "G")



    limit = 60

    left_top = triangle(
        limit=limit,
        step=-1
        )
    left_bottom =triangle(
        limit=limit,
        step=1
        )
    right_top = rev_triangle(
        limit=limit,
        step=-1
        )
    right_bottom = rev_triangle(
        limit=limit,
        step=1
        )
    
    #for row in range(limit):
    #    print(f"{left_top[row]}{right_top[row]}")
    #for row in range(limit):
    #    print(f"{left_bottom[row]}{right_bottom[row]}")
    


if __name__ == '__main__':
    __main()