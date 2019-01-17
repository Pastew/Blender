# This script will iterate each folder.
# If folder contais any file with filname starting with render 
# it will create a section for this folder with all render* images and put it in readme.md file.

rm readme.md
echo "# My blender hobby projects" >> readme.md
echo "NOTE: This is auto-generated readme.md file. See **readme_maker.sh**" >> readme.md
for folder in *; do 
	ls -l $folder/render* #check if it is directory and if it contains any render* file. If not - do nothing
	if [[ $? -eq 0 ]]; then # it means there are some render* files inside $folder
		echo "## $folder" >> readme.md
		for n in $folder/render*; do 
			#printf '%s\n' "$n";
			echo "![Alt text]($n?raw=true \"$n\")" >> readme.md
		done
	fi
done

echo "  " >> readme.md
echo "  " >> readme.md

echo ""
echo ""
echo "readme.md file result:"
cat readme.md