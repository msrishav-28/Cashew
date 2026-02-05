import os

file_path = r'c:\Users\user\Documents\Github 2\cashew\budget\assets\translations\translations.csv'

try:
    with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
        lines = f.readlines()
        for i, line in enumerate(lines):
            if 'cashew' in line.lower():
                print(f"{i+1}: {line.strip()[:200]}...")
except Exception as e:
    print(f"Error: {e}")
