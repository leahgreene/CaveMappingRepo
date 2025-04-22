import os

import pandas as pd


def remove_redundant_info(data, threshold):
    """
    Removes redundant rows based on a spatial threshold.

    Parameters:
        data (pd.DataFrame): The DataFrame with point cloud data.
        threshold (float): The spatial threshold for redundancy.

    Returns:
        pd.DataFrame: The filtered DataFrame with unique points.
    """
    # Initialize an empty list to store unique rows
    unique_rows = [data.iloc[0]]  # Start with the first row as unique

    # Iterate through the rows, comparing each row to the last unique row
    for i in range(1, len(data)):
        last_unique = unique_rows[-1]
        current = data.iloc[i]

        # Check if the differences in spatial data are below the threshold
        if (
                abs(current['RelPos_X'] - last_unique['RelPos_X']) > threshold or
                abs(current['RelPos_Y'] - last_unique['RelPos_Y']) > threshold or
                abs(current['RelPos_Z'] - last_unique['RelPos_Z']) > threshold or
                abs(current['Point_Easting'] - last_unique['Point_Easting']) > threshold or
                abs(current['Point_Northing'] - last_unique['Point_Northing']) > threshold or
                abs(current['Point_Height'] - last_unique['Point_Height']) > threshold
        ):
            unique_rows.append(current)

    # Convert the list of unique rows back to a DataFrame
    return pd.DataFrame(unique_rows)


def remove_by_axis_threshold(data, axis, value, condition="above"):
    """
    Filters rows in the DataFrame based on the specified axis and threshold condition.

    Parameters:
        data (pd.DataFrame): The DataFrame to filter.
        axis (str): The axis on which to apply the threshold ('x', 'y', or 'z').
        value (float): The threshold value.
        condition (str): 'above' to remove values above the threshold, 'below' to remove values below the threshold.

    Returns:
        pd.DataFrame: The filtered DataFrame.
    """
    # Map the axis to the appropriate column
    axis_map = {
        'x': 'RelPos_X',
        'y': 'RelPos_Y',
        'z': 'RelPos_Z'
    }

    # Check if the axis is valid
    if axis not in axis_map:
        raise ValueError("Invalid axis. Choose from 'x', 'y', or 'z'.")

    column = axis_map[axis]

    # Filter data based on the condition
    if condition == "above":
        filtered_data = data[data[column] <= value]
    elif condition == "below":
        filtered_data = data[data[column] >= value]
    else:
        raise ValueError("Invalid condition. Choose 'above' or 'below'.")

    return filtered_data


def apply_limit_filters(data):
    """
    Removes any rows where:
    - 'RelPos_X' exceeds 5
    - 'RelPos_Y' exceeds 10
    - 'RelPos_Z' exceeds 7

    Parameters:
        data (pd.DataFrame): The DataFrame to filter.

    Returns:
        pd.DataFrame: The filtered DataFrame.
    """
    return data[(data['RelPos_X'] <= 5) & (data['RelPos_Y'] <= 10) & (data['RelPos_Z'] <= 7)]



def process_frames_in_folder(input_folder, threshold, output_folder, axis=None, value=None, condition="above"):
    # # List all files in the folder
    # files = os.listdir(input_folder)
    #
    # # Loop through the files in the input folder
    # for file in files:
    #     if file.endswith(".csv"):  # Ensure we only process CSV files
    #         input_file = os.path.join(input_folder, file)
    #         frame_number = file.split('_')[1].split('.')[0]
    #         output_file = os.path.join(output_folder, f"filtered_frame_{frame_number}.csv")  # Modify output file name
    #
    #         # Apply the remove_redundant_info function to each file
    #         remove_redundant_info(input_file, threshold, output_file)

    # Ensure the output folder exists
    os.makedirs(output_folder, exist_ok=True)

    # List all files in the folder
    files = os.listdir(input_folder)

    # Loop through the files in the input folder
    for file in files:
        if file.endswith(".csv"):  # Ensure we only process CSV files
            input_file = os.path.join(input_folder, file)
            frame_number = file.split('_')[1].split('.')[0]
            output_file = os.path.join(output_folder, f"filtered_frame_{frame_number}.csv")  # Modify output file name

            # Apply the remove_redundant_info function to each file
            data = pd.read_csv(input_file)
            filtered_data = remove_redundant_info(data, threshold)

            filtered_data = apply_limit_filters(filtered_data)

            # Save the final filtered data to the output file
            filtered_data.to_csv(output_file, index=False)
            print(f"Filtered data saved to {output_file}")


# Usage Example:
input_folder = r"C:\Users\User\OneDrive - University College Dublin\Masters\year two\FYP\Datasets\Hesai_Oct2022\frames"
output_folder = r"C:\Users\User\OneDrive - University College Dublin\Masters\year two\FYP\Datasets\Hesai_Oct2022\frames_filtered"  # The folder where filtered CSVs will be saved
threshold = 0.1  # Define the threshold value for filtering
axis = 'y'
value = 10
condition = 'above'

process_frames_in_folder(input_folder, threshold, output_folder, axis=axis, value=value, condition=condition)
