#### Vybrání knihoven
```python
import numpy as np
from sklearn.datasets import make_blobs
import matplotlib.pyplot as plt
```
#### Nastavení parametrů
```python
k = 5
tolerance = 1e-4
max_iterations = 100
```
#### vytvoření bodů
```python
X, y = make_blobs(n_samples=500, centers=5, n_features=2, random_state=0)
```

#### Vybrání náhodných indexů
podle těchto indexů jsou dále vybrány strědy
```python
indices = np.random.choice(X.shape[0], size=k, replace=False)
centroids = X[indices]
```

#### Samotný výpočet
1. vytvoření cyklu
```python
for _ in range(max_iterations):
```
2.  uložení starých stavů
```python
	old_centroids = centroids
```
3. 
```python
	distances = np.sqrt(((X - centroids[:, np.newaxis])**2).sum(axis=2))
```
4.  Získání min indexů na $x$ ose
```python
	cluster_assignment = np.argmin(distances, axis=0)
```
5. 
```python
	centroids = np.array([X[cluster_assignment == i].mean(axis=0) for i in range(k)])
```
6.  porovnání vzdálenosti posunu
```python
	diff = np.linalg.norm(centroids - old_centroids)
```
7. Kontrola rozdílů vůči toleranci
```python
	if diff < tolerance:
		break
```
#### Vykreslení grafu
```python
plt.scatter(X[:,0],X[:,1], c = y)
plt.scatter(centroids[:,0],centroids[:,1], c = 'red', marker = 'X')
plt.grid()
plt.title("Body různých tříd v prostoru příznaků")
plt.show()
```