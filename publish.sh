#!/bin/bash

# Function to check if a file is a draft
is_draft() {
    local file="$1"
    grep -q "^draft: *false" "$file"
    return $?
}

# Clear the public directory
trash public/*

# Create a temporary file to store the list of published files
published_files=$(mktemp)

# Process Markdown files
for file in content/*.md; do
    if is_draft "$file"; then
        echo "Processing: $file"
        output_file="public/$(basename "$file" .md).html"
        pandoc "$file" -o "$output_file" --template=template.html --katex
        echo "$output_file" | sed 's|^public/||' >> "$published_files"
    else
        echo "Skipping draft: $file"
    fi
done

# Copy static files and root files
mkdir -p public/static
cp -r static/* public/static/
find static -type f | sed 's|^static/|static/|' >> "$published_files"
for root_file in root/*; do
    if [ -f "$root_file" ] && ! is_draft "$root_file"; then
        cp "$root_file" public/
        basename "$root_file" >> "$published_files"
    fi
done

# Change to the public directory
cd public

# Delete files that are in the upstream but not in the current build
git ls-files | grep -vFf "$published_files" | xargs -r git rm -f

# Commit and push changes
git add *
git commit -m "Rebuilding site $(date)"
git push origin HEAD:master

# Clean up
rm "$published_files"