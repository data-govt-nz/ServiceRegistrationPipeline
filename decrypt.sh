#!/bin/bash
if [ -f .env ]; then
    source .env
fi

set -eu

FILES=$FILES_TO_PUBLISH_DIR*.gpg

for f in $FILES
do
  echo "Processing $f file..."
  output_file=${f%.*}

  #decrypt the files
  gpg --batch --yes --output $output_file --decrypt $f
  echo "$output_file decrypted"

  #clean up
  rm $f

done
