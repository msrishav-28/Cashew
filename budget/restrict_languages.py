import csv
import os

file_path = r'c:\Users\user\Documents\Github 2\cashew\budget\assets\translations\translations.csv'
temp_file_path = r'c:\Users\user\Documents\Github 2\cashew\budget\assets\translations\translations_temp.csv'

# Target languages (column headers)
# Assuming 'Key' is the first column
# "en": "en", "hi": "hi", "bn": "bn", "gu": "gu", "ml": "ml", "mr": "mr", "ta": "ta", "te": "te", "ur": "ur"
target_headers = ['Key', 'en', 'hi', 'bn', 'gu', 'ml', 'mr', 'ta', 'te', 'ur']

try:
    with open(file_path, 'r', encoding='utf-8', newline='') as infile, \
         open(temp_file_path, 'w', encoding='utf-8', newline='') as outfile:
        
        reader = csv.DictReader(infile)
        
        # Verify all target headers exist in the source
        available_headers = reader.fieldnames
        valid_headers = [h for h in target_headers if h in available_headers]
        
        if len(valid_headers) != len(target_headers):
            missing = set(target_headers) - set(valid_headers)
            print(f"Warning: Missing headers in source CSV: {missing}")
            # We proceed with extracted valid_headers
        
        writer = csv.DictWriter(outfile, fieldnames=valid_headers)
        writer.writeheader()
        
        for row in reader:
            # Create a new row dictionary with only the valid headers
            filtered_row = {header: row[header] for header in valid_headers}
            writer.writerow(filtered_row)

    # Replace original file
    os.replace(temp_file_path, file_path)
    print("Successfully filtered translations.csv")

except Exception as e:
    print(f"Error: {e}")
