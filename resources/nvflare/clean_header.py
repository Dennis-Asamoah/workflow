#!/usr/bin/env python3
import sys
import pandas


def clean_csv_header(input_file, output_file):
    # Read the entire file to count the total number of lines
    with open(input_file, 'r') as file:
        lines = file.readlines()

    # Extract the header (second line) and clean it by removing type annotations
    header_line = lines[1].rstrip()
    clean_header = [col.split(':')[0] for col in header_line.split(",")]

    # Calculate the total number of rows, excluding the last line
    total_lines = len(lines)
    valid_rows = total_lines - 1

    # Read the CSV, skip the first two rows (condition_era and header), and stop before the last row
    df = pandas.read_csv(input_file, skiprows=2, header=None, nrows=valid_rows - 2)  # Substract 2 for the skipped lines

    # Assign the cleaned headers to the DataFrame
    df.columns = clean_header

    # Save the cleaned DataFrame to the output file
    df.to_csv(output_file, index=False)


if __name__ == "__main__":
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    clean_csv_header(input_file, output_file)