import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# Load data from CSV where columns are named x(m), y(m), z(m)
input_file = r"C:\Users\User\Downloads\HesaiXT32M2X_sample data with GNSS-INS\XT32_graham1__2022_10_12_17_40_50.csv"


# Read the CSV into a DataFrame
df = pd.read_csv(input_file)

x_vals = []
y_vals = []
z_vals = []

for _, row in df.iterrows():
    x_vals.append(row['RelPos_X'])
    y_vals.append(row['RelPos_Y'])
    z_vals.append(row['RelPos_Z'])

x = np.array(x_vals)
y = np.array(y_vals)
z = np.array(z_vals)

# Create a meshgrid for plotting if you have grid-like data (optional, depending on your data)
# This assumes that the x and y values correspond to a 2D grid. If not, you can skip meshgrid.
X, Y = np.meshgrid(np.unique(x), np.unique(y))

# If your data points are not on a perfect grid, you might want to use an interpolation technique
# to create a grid of z values. For simplicity, let's assume you have structured grid data for now.
# Create the 3D plot
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

# Scatter plot of the points
scatter = ax.scatter(x, y, z, c=z, cmap='viridis')

# Add color bar to the plot
fig.colorbar(scatter, ax=ax, label='Z values')

# Labels
ax.set_xlabel('X Label')
ax.set_ylabel('Y Label')
ax.set_zlabel('Z Label')

# Title
ax.set_title('3D Scatter Plot of X, Y, Z Data')

# Show plot
plt.show()