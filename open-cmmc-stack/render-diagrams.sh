#!/bin/bash

# Set input and output paths
INPUT_DIR="docs/img/diagrams"
OUTPUT_DIR="docs/img/svg"
CONFIG_FILE="disable-sandbox.json"

# Ensure output directory exists
mkdir -p "$OUTPUT_DIR"

# Loop over each .mmd file and render it
for file in "$INPUT_DIR"/*.mmd; do
  filename=$(basename "$file")
  name="${filename%.*}"
  output="$OUTPUT_DIR/$name.svg"

  echo "🖼️ Rendering $filename → $output"
  mmdc -i "$file" -o "$output" -p "$CONFIG_FILE"
done

echo "✅ All Mermaid diagrams have been rendered to $OUTPUT_DIR"
