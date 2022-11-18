import matplotlib.pyplot as plt
import numpy as np

# make data
x = np.linspace(0, 10, 100)
y = ((np.sin(x)**3)*x)**3-(np.cos(x)**4)*x

# plot
fig, ax = plt.subplots()

ax.plot(x, y, linewidth=1.0)


def limits(x,y):
    x_max = x +1
    y_max = y +1

    return {
        'x': [0, x_max],
        'y': [0, y_max],
    }

ax.set(xlim=(0, 10), xticks=np.arange(0, 10),
       ylim=(-10, 10), yticks=np.arange(-10, 10))

plt.show()