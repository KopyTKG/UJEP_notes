import numpy as np
from sklearn.datasets import make_blobs
import matplotlib.pyplot as plt


k = 5
tolerance = 1e-4
max_iterations = 100


# generování bodů
X, y = make_blobs(n_samples=500, centers=5, n_features=2, random_state=0)

# random indexes
indices = np.random.choice(X.shape[0], size=k, replace=False)
# centroids array
centroids = X[indices]



# loop
for _ in range(max_iterations):
    old_centroids = centroids

    # update centroids
    distances = np.sqrt(((X - centroids[:, np.newaxis])**2).sum(axis=2))
    # assign each point in X to the nearest centroid
    cluster_assignment = np.argmin(distances, axis=0)

    # update centroids
    centroids = np.array([X[cluster_assignment == i].mean(axis=0) for i in range(k)])

    # check if centroids have changed
    diff = np.linalg.norm(centroids - old_centroids)
    if diff < tolerance:
        break



plt.scatter(X[:,0],X[:,1], c = y)
plt.scatter(centroids[:,0],centroids[:,1], c = 'red', marker = 'X')
plt.grid()
plt.title("Body různých tříd v prostoru příznaků")
plt.show()
