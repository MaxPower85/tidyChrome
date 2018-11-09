clear
echo -e "
tidyChrome script v1.0 by MaxPower85 (https://github.com/MaxPower85). 
Copyright 2018. GPLv3.

To run this script, make sure that Chrome is in your Applications folder.


This script is meant for Mac users, to run it after Chrome updates itself, to remove the previous version (that Chrome still keeps as some sort of a backup even after a successful update) and to enable HFS+ compression for the newest version, to make Chrome use less space on disk (since Chrome's updater doesn't seem to enable HFS+ compression automatically, like when you install something from the AppStore).

The script is provided as it is, without any warranty and without guarantees that it is going to function without issues. It is meant for users who have experience with the Terminal and understand what these commands do. By using this script, the user takes full responsibility for anything that results from using it and agrees not to blame the author if something unwanted happens by using this script. If something changes in the future that breaks the script or starts causing some issue, please submit a bug report, but keep in mind that the author can't predict the future. "

path="/Applications/Google Chrome.app/Contents/"
cd "$path"

echo -e "\nVersions found: \n"

ls Versions/

newest_versions_directory=$(ls -td "$path"Versions/* | head -1)
version_name=`basename "$newest_versions_directory"`

echo -e "\nNewest version: $version_name\n"

read -e -p "
Enable HFS+ compression for the newest version and remove other versions? [y/N]
" answer

if [ "$answer" == "y" ]
then

	ditto --hfsCompression "$newest_versions_directory" hfs_compressed

	rm -rf Versions/*
	mv hfs_compressed "$newest_versions_directory"

	echo -e "\nDone\n"

fi
