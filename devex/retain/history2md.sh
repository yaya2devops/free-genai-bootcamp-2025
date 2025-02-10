#!/bin/bash

# Reload history to capture the latest commands
history -r

# Get the current directory
current_directory=$(pwd)

# Create the markdown file with a title
echo "# Command History" > "$current_directory/history.md"
echo "" >> "$current_directory/history.md"
echo "Generated on $(date)" >> "$current_directory/history.md"
echo "" >> "$current_directory/history.md"

# Process history and append to the file with command numbers and proper formatting
history | awk '{ 
    printf "```bash\n"   # Start code block
    printf "%s %s\n", $1, substr($0, index($0,$2))  # Command number and the command itself
    printf "```\n\n"   # End code block
}' >> "$current_directory/history.md"

echo "History saved to $current_directory/history.md"
