import pandas as pd
import os

# Ask user for the input file path
input_file = input("Enter the full path of the CSV file: ").strip()

# Remove quotations around path if present
input_file = input_file.strip('"').strip("'")

# Validate if file exists
if not os.path.isfile(input_file):
    print("Error: The specified file does not exist.")
    exit()

# Create folder for output files
output_dir = os.path.join(os.path.dirname(input_file), "frames")
os.makedirs(output_dir, exist_ok=True)

# Load CSV file into a DataFrame
data = pd.read_csv(input_file, delimiter=',')  # Adjust delimiter if necessary

# Group the data by 'FrameIdx' and save each group to a separate CSV file
for frame_idx, frame_data in data.groupby('FrameIdx'):
    output_file = os.path.join(output_dir, f'frame_{int(frame_idx)}.csv')
    frame_data.to_csv(output_file, index=False, sep=',', encoding='utf-8')
    print(f"Saved frame {frame_idx} to {output_file}")

print(f"Data split into separate CSV files in: {output_dir}")
