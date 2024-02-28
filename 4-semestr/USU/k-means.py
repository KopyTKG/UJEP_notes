import numpy as np
import matplotlib.pyplot as plt
from sklearn.datasets import make_blobs


# generování bodů
X, y = make_blobs(n_samples=500, centers=5, n_features=2, random_state=0)
def initialize_centroids(X, k):
    """Randomly initialize k centroids from the dataset X."""
    indices = np.random.choice(X.shape[0], size=k, replace=False)
    centroids = X[indices]
    return centroids

def assign_clusters(X, centroids):
    """Assign each point in X to the nearest centroid."""
    distances = np.sqrt(((X - centroids[:, np.newaxis])**2).sum(axis=2))
    cluster_assignment = np.argmin(distances, axis=0)
    return cluster_assignment

def update_centroids(X, cluster_assignment, k):
    """Update centroids by calculating the mean of points in each cluster."""
    new_centroids = np.array([X[cluster_assignment == i].mean(axis=0) for i in range(k)])
    return new_centroids

def k_means(X, k, max_iterations=100, tolerance=1e-4):
    """The K-means algorithm."""
    centroids = initialize_centroids(X, k)
    for _ in range(max_iterations):
        old_centroids = centroids
        cluster_assignment = assign_clusters(X, centroids)
        centroids = update_centroids(X, cluster_assignment, k)
        diff = np.linalg.norm(centroids - old_centroids)
        if diff < tolerance:
            break
    return centroids, cluster_assignment

# Number of clusters
k = 5
centroids, cluster_assignment = k_means(X, k, max_iterations=100, tolerance=1e-4)

# Plotting
plt.scatter(X[:, 0], X[:, 1], c=cluster_assignment, s=50, cmap='viridis')
plt.scatter(centroids[:, 0], centroids[:, 1], c='red', s=100, marker='X')
plt.title("K-means Clustering")
plt.grid()
plt.show()