import os
from pyproj import Proj, Transformer
import pandas as pd
import matplotlib.pyplot as plt

# Define the origin in latitude, longitude, and altitude (in degrees and meters)
origin_lat = 55.976318  # Latitude of origin point (e.g., Edinburgh)
origin_lon = -3.170086  # Longitude of origin point (e.g., Edinburgh)
origin_alt = 1.8  # Altitude (elevation) of the origin point in meters

# Initialize a custom transformer
# Use an azimuthal equidistant projection centered at the origin for accurate local metric distances
# local_proj = Proj(proj="aeqd", lat_0=origin_lat, lon_0=origin_lon, datum="WGS84", units="m")
# wgs84_proj = Proj(proj="latlong", datum="WGS84")
# transformer = Transformer.from_proj(local_proj, wgs84_proj)

# Initialize a transformer for the local coordinates (using UTM)
# Note: Edinburgh is generally in UTM zone 30N
utm_proj = Proj(proj='utm', zone=30, datum='WGS84')
wgs84_proj = Proj(proj='latlong', datum='WGS84')
transformer = Transformer.from_proj(utm_proj, wgs84_proj)

# Load data from CSV where columns are named x(m), y(m), z(m)
input_file = r"C:\Users\User\OneDrive - University College Dublin\Masters\year two\FYP\Pandar_13June2023\linebridge.csv"
output_file = r"C:\Users\User\OneDrive - University College Dublin\Masters\year two\FYP\Pandar_13June2023\line_mod.csv"

# Read the CSV into a DataFrame
df = pd.read_csv(input_file)

# Convert each x, y point from the local projection to latitude and longitude
latitudes = []
longitudes = []
elevations = []

# Process each row in the DataFrame
for _, row in df.iterrows():
    # Convert (x(m), y(m)) in meters to latitude and longitude using UTM
    # The origin is converted to UTM first
    origin_easting, origin_northing = utm_proj(origin_lon, origin_lat)

    # Calculate the easting and northing for the current point
    easting = origin_easting + row['x(m)']
    northing = origin_northing + row['y(m)']

    # Transform UTM coordinates to geographic coordinates (lat/lon)
    lon, lat = transformer.transform(easting, northing)

    # Calculate elevation relative to the origin altitude
    elevation = origin_alt + row['z(m)']

    # Append results to lists
    latitudes.append(lat)
    longitudes.append(lon)
    elevations.append(elevation)


# # Process each row in the DataFrame
# for _, row in df.iterrows():
#     # Convert (x(m), y(m)) in meters to latitude and longitude
#     lon, lat = transformer.transform(row['x(m)'], row['y(m)'], direction="INVERSE")
#
#     # Calculate elevation relative to the origin altitude
#     elevation = origin_alt + row['z(m)']
#
#     # Append results to lists
#     latitudes.append(lat)
#     longitudes.append(lon)
#     elevations.append(elevation)

# Add the latitude, longitude, and elevation to the DataFrame
df['latitude'] = latitudes
df['longitude'] = longitudes
df['elevation'] = elevations

# Save the updated DataFrame to a new CSV file
if not os.path.exists(output_file):
    print(f"{output_file} does not exist. It will be created.")

df.to_csv(output_file, index=False)

print(f"Converted coordinates saved to {output_file}")