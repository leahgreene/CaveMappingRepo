import pandas as pd

# Load the large CSV file into a DataFrame
input_file = r'C:\Users\User\OneDrive - University College Dublin\Masters\year two\FYP\Hesai_Oct2022\filtered_data.csv'
data = pd.read_csv(input_file, delimiter=',')  # Assuming tab-delimited data

# Group the data by 'FrameIdx' and save each group to a separate CSV file
for frame_idx, frame_data in data.groupby('FrameIdx'):
    # Define the output file name based on the frame index
    output_file = f'C:\\Users\\User\\OneDrive - University College Dublin\\Masters\\year two\\FYP\\Hesai_Oct2022\\frames\\frame_{int(frame_idx)}.csv'

    # Save the group to a CSV file
    frame_data.to_csv(output_file, index=False, sep=',', encoding='utf-8')

    print(f"Saved FrameIdx {frame_idx} to {output_file}")

print("Data split into separate CSV files by FrameIdx.")