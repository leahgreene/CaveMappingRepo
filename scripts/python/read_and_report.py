import csv

def read_csv_first_last_and_save(file_path, output_path):
    """
    Reads a large CSV file, collects the first 33 rows and the last 32 rows,
    and writes them to a new CSV file.

    Parameters:
        file_path (str): Path to the original CSV file.
        output_path (str): Path to the new CSV file where the result will be saved.
    """
    first_thirty_three = []
    last_thirty_two = []

    try:
        with open(file_path, 'r', newline='', encoding='utf-8') as csvfile:
            reader = csv.reader(csvfile)

            # Collect the first 33 rows
            for _ in range(33):
                try:
                    first_thirty_three.append(next(reader))
                except StopIteration:
                    break

            # Iterate through the file to find the last 32 rows efficiently
            buffer = []
            for row in reader:
                buffer.append(row)
                if len(buffer) > 32:
                    buffer.pop(0)

            last_thirty_two = buffer

    except FileNotFoundError:
        print(f"Error: File not found at {file_path}")
        return
    except Exception as e:
        print(f"Error: {e}")
        return

    # Write the collected rows to a new CSV file
    try:
        with open(output_path, 'w', newline='', encoding='utf-8') as outfile:
            writer = csv.writer(outfile)

            # Write the first 33 rows and last 32 rows to the new file
            writer.writerows(first_thirty_three)
            writer.writerows(last_thirty_two)

        print(f"New CSV file created at {output_path}")

    except Exception as e:
        print(f"Error while writing to file: {e}")

# Example usage
# Provide the path to your CSV file and the desired output path for the new CSV
file_path = r"C:\Users\User\Downloads\HesaiXT32M2X_sample_data_28_dec\XT32_graham1__2022_10_12_17_40_50.csv"
output_path = r"C:\Users\User\Downloads\HesaiXT32M2X_sample_data_28_dec\output.csv"
read_csv_first_last_and_save(file_path, output_path)
