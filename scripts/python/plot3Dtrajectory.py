import pandas as pd
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# === Load CSV ===
df = pd.read_csv("C:\\Users\\User\\OneDrive - University College Dublin\\Masters\\year two\\FYP\\System\\INS recordings\\outside2_converted.csv")

# Optional: rename columns for easier access
df.columns = df.columns.str.strip().str.replace(" ", "_").str.replace("(", "").str.replace(")", "")

# === 3D Plot ===
fig = plt.figure(figsize=(10, 6))
ax = fig.add_subplot(111, projection='3d')

# Color by time (optional)
colors = df["GPS_Time"]

# Plot the trajectory
ax.plot(df["Longitude"], df["Latitude"], df["Altitude_MSL"], color='blue', label='Trajectory')
ax.scatter(df["Longitude"], df["Latitude"], df["Altitude_MSL"], c=colors, cmap='viridis', s=20)

# Axis labels
ax.set_xlabel("Longitude")
ax.set_ylabel("Latitude")
ax.set_zlabel("Altitude (m)")
ax.set_title("3D Trajectory from CSV")
ax.legend()

plt.tight_layout()
plt.show()
