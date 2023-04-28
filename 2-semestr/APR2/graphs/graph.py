from igraph import *
from matplotlib import pyplot as plt

def fillVertices(g,num):
    g.add_vertices(num)

def nameVertices(g, cl, row):
    names = []
    for row in range(row):
        for cl in range(cl):
            names.append(f"[{row},{cl}]")
    g.vs["name"] = names
    
def generateMesh(g):
    links = []
    for row in range(0,26,5):
        for cl in range(row-1):
            links.append((cl, cl+1))
            
    print(links)
    g.add_edges(links)
    pass

def render(g):
    fig, ax = plt.subplots()
    plot(g, target=ax)

def main():
    g = Graph()
    fillVertices(g, 25)
    nameVertices(g, 5, 5)
    generateMesh(g)
    g.es["duplex"] = [True, True, False]
    render(g)
    print(g)
    print("stop")


if __name__ == "__main__":
    main()