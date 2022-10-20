import tkinter
from tkinter import font
from random import randint as random
from copy import deepcopy as cp

root = tkinter.Tk()
root.title("Střelba na terč")

Raleway = font.Font(family='Arial', size=22)

canvas = tkinter.Canvas(root, bg="gray", height=1000, width=1000)

border = canvas.create_rectangle(0,0,1000,1000, fill="red")
field = canvas.create_rectangle(5,5,995,995, fill="lightgray")

size_label = tkinter.Label(root, text="1000x1000")


loc_x, loc_y, radius = random(175, 825), random(175, 825), random(75, 200)
pruh, normal, center = 1, int((cp(radius)) * (2/11)) , int((cp(radius)) * (3/11))

cords = [
    ( # border
        (cp(loc_x) - cp(radius)),
        (cp(loc_y) - cp(radius)),
        (cp(loc_x) + cp(radius)),
        (cp(loc_y) + cp(radius))
    ),
    ( # white
        (cp(loc_x) -(cp(radius) - cp(pruh))),
        (cp(loc_y) -(cp(radius) - cp(pruh))),
        (cp(loc_x) +(cp(radius) - cp(pruh))), 
        (cp(loc_y) +(cp(radius) - cp(pruh)))
    ),
    ( # border
        (cp(loc_x) -(cp(radius) - cp(pruh) - cp(normal))),
        (cp(loc_y) -(cp(radius) - cp(pruh) - cp(normal))),
        (cp(loc_x) +(cp(radius) - cp(pruh) - cp(normal))),
        (cp(loc_y) +(cp(radius) - cp(pruh) - cp(normal)))
    ),
    ( # gray
        (cp(loc_x) -(cp(radius) - 2*cp(pruh) - cp(normal))),
        (cp(loc_y) -(cp(radius) - 2*cp(pruh) - cp(normal))),
        (cp(loc_x) +(cp(radius) - 2*cp(pruh) - cp(normal))),
        (cp(loc_y) +(cp(radius) - 2*cp(pruh) - cp(normal)))
    ),
    ( # border
        (cp(loc_x) -(cp(radius) - 2*cp(pruh) - 2*cp(normal))),
        (cp(loc_y) -(cp(radius) - 2*cp(pruh) - 2*cp(normal))),
        (cp(loc_x) +(cp(radius) - 2*cp(pruh) - 2*cp(normal))),
        (cp(loc_y) +(cp(radius) - 2*cp(pruh) - 2*cp(normal)))
    ),
    ( # blue
        (cp(loc_x) -(cp(radius) - 3*cp(pruh) - 2*cp(normal))),
        (cp(loc_y) -(cp(radius) - 3*cp(pruh) - 2*cp(normal))),
        (cp(loc_x) +(cp(radius) - 3*cp(pruh) - 2*cp(normal))),
        (cp(loc_y) +(cp(radius) - 3*cp(pruh) - 2*cp(normal)))
    ),
    ( # border
        (cp(loc_x) -(cp(radius) - 3*cp(pruh) - 3*cp(normal))),
        (cp(loc_y) -(cp(radius) - 3*cp(pruh) - 3*cp(normal))),
        (cp(loc_x) +(cp(radius) - 3*cp(pruh) - 3*cp(normal))),
        (cp(loc_y) +(cp(radius) - 3*cp(pruh) - 3*cp(normal)))
    ),
    ( # red
        (cp(loc_x) -(cp(radius) - 4*cp(pruh) - 3*cp(normal))),
        (cp(loc_y) -(cp(radius) - 4*cp(pruh) - 3*cp(normal))),
        (cp(loc_x) +(cp(radius) - 4*cp(pruh) - 3*cp(normal))),
        (cp(loc_y) +(cp(radius) - 4*cp(pruh) - 3*cp(normal)))
    ),
    ( # border
        (cp(loc_x) -(cp(radius) - 4*cp(pruh) - 4*cp(normal))),
        (cp(loc_y) -(cp(radius) - 4*cp(pruh) - 4*cp(normal))),
        (cp(loc_x) +(cp(radius) - 4*cp(pruh) - 4*cp(normal))),
        (cp(loc_y) +(cp(radius) - 4*cp(pruh) - 4*cp(normal)))
    ),
    ( # orange
        (cp(loc_x) -(cp(radius) - 5*cp(pruh) - 5*cp(normal) - cp(center))),
        (cp(loc_y) -(cp(radius) - 5*cp(pruh) - 5*cp(normal) - cp(center))),
        (cp(loc_x) +(cp(radius) - 5*cp(pruh) - 5*cp(normal) - cp(center))),
        (cp(loc_y) +(cp(radius) - 5*cp(pruh) - 5*cp(normal) - cp(center)))
    ),
    ]

colors = ["black", "white", "black", "darkgray", "black", "blue", "black", "red", "black", "orange"]
index = 0
for cord in cords:
    canvas.create_oval(cord, fill=colors[index])
    index +=1

input_field = tkinter.Text(root,width=20, height=1)

def Shoot():
    shot_cords = input_field.get("1.0", "end-1c")
    shot_x, shot_y = map(int, shot_cords.split(";"))
    if cords[0][0] <= shot_x <= cords[0][2]:
        if cords[0][1] <= shot_y <= cords[0][3]:
            canvas.create_oval(shot_x, shot_y, shot_x+10,shot_y+10, fill="yellow")
    else:
        canvas.create_oval(shot_x, shot_y, shot_x+10,shot_y+10, fill="black")


btn = tkinter.Button(root, text="Strelba", command=Shoot)


size_label.pack()
canvas.pack()
input_field.pack()
btn.pack()

root.mainloop()