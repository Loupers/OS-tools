#!/bin/bash

REPO="${1:-upstream}" 

EXIST="$(git remote -v | grep $REPO)"

if [ -z "$EXIST" ];then
	echo "$REPO NOT SET"
	read -p "Do you want to set up new url for new repo? (y/n) " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
	read -p "Insert url: " url || exit 1
	echo "$url"
	git remote add "$REPO" "$url"
fi

echo "Fetching upstream $REPO"

git fetch "$REPO"

echo "Merging upstream changes"

git merge -m "Merge upstream changes" upstream/master

echo "Pushing merged changes"

git push


