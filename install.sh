#!/bin/sh

# Find all files in the home folder and remove the ./home/ prefix
files=$(find ./home -type f | sed 's,^\./home/,,')

for file in files; do
    # Delete file in home folder with the same name if it exists
    rm -rf "$HOME/$file"
    # Create a symbolic link to the file in the home folder
    ln -s "$PWD/home/$file" "$HOME/$file"
done


