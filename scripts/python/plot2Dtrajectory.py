import pandas as pd
import matplotlib.pyplot as plt

# === Load CSV ===
df = pd.read_csv("C:\\Users\\User\\OneDrive - University College Dublin\\Masters\\year two\\FYP\\System\\INS recordings\\outside2_converted.csv")

# Clean up column names (optional but helpful)
df.columns = df.columns.str.strip().str.replace(" ", "_").str.replace("(", "").str.replace(")", "")

# === 2D Plot ===
plt.figure(figsize=(8, 6))

# Plot line
plt.plot(df["Longitude"], df["Latitude"], color='blue', linewidth=2, label="Trajectory")

# Optional: color dots by time to show direction
sc = plt.scatter(df["Longitude"], df["Latitude"], c=df["GPS_Time"], cmap='viridis', s=20)

# Labels and styling
plt.xlabel("Longitude")
plt.ylabel("Latitude")
plt.title("2D Trajectory Plot")
plt.grid(True)
plt.axis("equal")  # Equal aspect ratio for accurate geography
plt.colorbar(sc, label="GPS Time (s)")
plt.legend()
plt.tight_layout()
plt.show()
