#!/bin/bash

# Checks if input file is specified
if [ $# -ne 1 ]; then
  echo "Usage: $0 ID_file.txt"
  exit 1
fi

# Make sure the destination folder exists
destination_folder="images"
mkdir -p "$destination_folder"

# Read the ID file line by line
input_file="$1"
while IFS= read -r identifier; do
  # Adapt identifier to URL format
  formatted_identifier=$(echo "$identifier" | tr / -)

  # Construct download URL from formatted identifier
  url="https://heartofthecards.com/images/cards/ws/$formatted_identifier.png"

  # Download image
  wget -q -P "$destination_folder" "$url"

  # Check if the download was successful
  if [ $? -eq 0 ]; then
    echo "Downloaded: $url"
  else
    echo "Download failed: $url"
  fi
done <"$input_file"

echo "Download complete."
