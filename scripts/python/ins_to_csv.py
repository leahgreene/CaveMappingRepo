input_file = "C:\\Users\\User\\OneDrive - University College Dublin\\Masters\\year two\\FYP\\System\\INS recordings\\basement1.txt"
output_file = "C:\\Users\\User\\OneDrive - University College Dublin\\Masters\\year two\\FYP\\System\\INS recordings\\basement1_converted.csv"

with open(input_file, 'r') as fin, open(output_file, 'w') as fout:
    lines = fin.readlines()

    # Remove the comment line (first) and units line (third)
    cleaned_lines = [lines[1]] + lines[3:]  # keep header + data

    # Replace tabs with commas and write out
    with open(output_file, 'w') as fout:
        for line in cleaned_lines:
            fout.write(line.replace('\t', ','))