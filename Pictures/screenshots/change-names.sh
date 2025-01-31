#!/bin/bash

# Define invalid characters for exFAT
INVALID_CHARS='[\/:*?"<>|]'

# Loop through all files and directories in the current directory
for file in *; do
    # Skip if no files match (e.g., empty directory)
    [ -e "$file" ] || continue

    # Remove invalid characters
    new_name=$(echo "$file" | sed -E "s/$INVALID_CHARS/_/g")

    # Ensure new name is within the 255-character limit
    new_name="${new_name:0:255}"

    # Avoid renaming to an existing file
    if [ "$file" != "$new_name" ]; then
        if [ -e "$new_name" ]; then
            echo "Skipping '$file' -> '$new_name' (file already exists)"
        else
            mv -v "$file" "$new_name"
        fi
    fi
done

