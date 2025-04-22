import numpy as np
import pandas as pd
from sklearn.linear_model import RANSACRegressor


# Load data from CSV where columns are named x(m), y(m), z(m)
input_file = r"C:\Users\User\OneDrive - University College Dublin\Masters\year two\FYP\Pandar_13June2023\midbridge.csv"


def get_points(file):
    # Load data from CSV file
    df = pd.read_csv(file)

    # Extract x, y, and z values into arrays
    x_vals = df['x(m)'].to_numpy()
    y_vals = df['y(m)'].to_numpy()
    z_vals = df['z(m)'].to_numpy()

    # Combine x, y, z values into an Nx3 array
    points = np.column_stack((x_vals, y_vals, z_vals))  # Transpose to get Nx3 shape

    # Return as dictionary
    return {
        "x": x_vals,
        "y": y_vals,
        "z": z_vals,
        "points": points
    }


def fit_plane(points):
    # Use RANSAC or PCA to estimate a plane
    # Assuming points is an Nx3 array of (x, y, z)
    ransac = RANSACRegressor()
    X = points[:, :2]  # Assume Z as target
    Z = points[:, 2]
    ransac.fit(X, Z)
    normal = np.array([ransac.estimator_.coef_[0], ransac.estimator_.coef_[1], -1])
    normal /= np.linalg.norm(normal)  # Normalize
    C = np.mean(points, axis=0)  # Approximate C as the centroid
    return normal, C


def fit_line(points):
    # Use RANSAC to fit a line
    # points is Nx3 array of (x, y, z)
    ransac = RANSACRegressor()
    X = points[:, :1]  # Assuming the line is in 2D for simplicity
    Y = points[:, 1]
    ransac.fit(X, Y)
    direction = np.array([ransac.estimator_.coef_[0], 1, 0])
    direction /= np.linalg.norm(direction)  # Normalize
    C = np.mean(points, axis=0)  # Approximate C as the centroid
    return direction, C


def plot_primitives(plane_params, line_params, point_cloud):
    import matplotlib.pyplot as plt
    from mpl_toolkits.mplot3d import Axes3D

    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')

    # Plot point cloud
    ax.scatter(point_cloud[:, 0], point_cloud[:, 1], point_cloud[:, 2], c='b', s=1)

    # Plot planes
    for normal, C in plane_params:
        d = -C.dot(normal)
        xx, yy = np.meshgrid(range(-10, 10), range(-10, 10))
        zz = (-normal[0] * xx - normal[1] * yy - d) * 1. / normal[2]
        ax.plot_surface(xx, yy, zz, color='green', alpha=0.3)

    # Plot lines
    for U, C in line_params:
        line_x = np.array([C[0] - 10 * U[0], C[0] + 10 * U[0]])
        line_y = np.array([C[1] - 10 * U[1], C[1] + 10 * U[1]])
        line_z = np.array([C[2] - 10 * U[2], C[2] + 10 * U[2]])
        ax.plot(line_x, line_y, line_z, color='red')

    plt.show()

# Load Point Cloud Data
data = get_points(input_file)
point_cloud = data["points"]

# Fit Planes and Lines
# normal, plane_centroid = fit_plane(point_cloud)
# plane_params = [(normal, plane_centroid)]
direction, line_centroid = fit_line(point_cloud)
line_params = [(direction, line_centroid)]

# Example of filtering only points within a certain height range
filtered_points = point_cloud[point_cloud[:, 2] < -1.8]  # Keep only points where z < 1.8 meters (should be the ground)
normal, plane_centroid = fit_plane(filtered_points)
plane_params = [(normal, plane_centroid)]

# Plot Point Cloud with Planes and Lines
plot_primitives(plane_params, line_params, point_cloud)