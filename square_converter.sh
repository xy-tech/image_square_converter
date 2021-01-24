#! /bin/bash

readonly DIR=square

if [ ! -d "$DIR" ]; then
	mkdir $DIR
fi

for file in "$(pwd)"/*; do
	if [[ $file == *.jpg ]] || [[ $file == *.jpeg ]] || [[ $file == *.JPG ]] || [[ $file == *.JPEG ]]; then
		echo "$file"
		filename="${file##*/}"
		filename="${filename%.*}"
		magick -background white -gravity center "$file" -extent "%[fx:h>w?h:w]x%[fx:h>w?h:w]" "$DIR/$filename".jpg
	fi
done
