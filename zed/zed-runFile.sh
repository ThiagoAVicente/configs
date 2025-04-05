
#!/bin/bash

# Access the full path using ZED_FILE
full_path="$ZED_FILE"

# Extract filename with extension
filename_ext=$(basename "$full_path")

# Extract filename and extension
filename="${filename_ext%.*}"
extension="${filename_ext##*.}"

echo "[running $filename_ext]"

if [[ "$extension" == "cpp" ]]; then
    if [[ -f cppdependencies ]]; then
        g++ "$full_path" $(<cppdependencies) -o "$filename" && ./"$filename"
    else
        g++ "$full_path" -o "$filename" && ./"$filename"
    fi
elif [[ "$extension" == "c" ]]; then

    if [[ -f cdependencies ]]; then
        gcc "$full_path" $(<cdependencies) -o "$filename" && ./"$filename"
    else
        gcc "$full_path" -o "$filename" && ./"$filename"
    fi
elif [[ "$extension" == "py" ]]; then
    if [[ -f .envrc && -f .venv/bin/python3 ]]; then
        ./.venv/bin/python3 "$full_path"
    else
        python3 "$full_path"
    fi
else
    echo "Unsupported file type: $extension"
fi
