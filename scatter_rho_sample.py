import numpy as np
import matplotlib.pyplot as plt
import scipy.stats
import pandas as pd
from plotnine import *

n = 100
x = np.random.normal(0, 1, n)
y = x + np.random.normal(0, 0.2, n)

r = scipy.stats.pearsonr(x, y)

plt.scatter(x, y)
plt.text(0, 2, f"r = {r[0]:.3f}")

plt.show()

d = pd.DataFrame.from_dict({"x": x, "y": y})

ggplot(d) + geom_point(aes("x", "y"))
