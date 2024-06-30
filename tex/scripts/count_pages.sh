#!/bin/bash

# Check if a PDF file is specified
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <pdf-file>"
  exit 1
fi

# Check if pdfinfo is available
if ! command -v pdfinfo &> /dev/null; then
    echo "pdfinfo could not be found. Please install poppler-utils."
    exit 1
fi

PDF_FILE="$1"

# Use pdfinfo to get the number of pages
NUM_PAGES=$(pdfinfo "$PDF_FILE" | grep Pages | awk '{print $2}')

# Check if the number of pages is a multiple of 8
if [ $((NUM_PAGES % 8)) -ne 0 ]; then
  echo "Warning: The number of pages in $PDF_FILE is not a multiple of 8."
else
  echo "The number of pages in $PDF_FILE is a multiple of 8."
fi
