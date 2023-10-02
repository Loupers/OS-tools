#!/bin/bash

home_url="https://pages.cs.wisc.edu/~remzi/OSTEP/"
web="$(curl -s $home_url)"

tmp_file_one="$(mktemp)"
tmp_file_two="$(mktemp)"

echo "$web" | grep -E href=[A-Za-z0-9\-]*.pdf | cut -d "<" -f 3 | grep small| cut -d ">" -f 2 > "$tmp_file_one"
echo "$web" | grep -E href=[A-Za-z0-9\-]*.pdf | grep small | grep -Eo href=[A-Za-z0-9\-]*.pdf | cut -d = -f 2 > "$tmp_file_two"

tmp_dir="$(mktemp -d)"
while read -r page; do
	num="$(echo "$page" | cut -d '#' -f 1)"
	page="$(echo "$page" | cut -d '#' -f 2)"
	wget -q "$home_url$page" -O "$tmp_dir/$num-$page"
done <<< "$(paste -d '#' "$tmp_file_one" "$tmp_file_two" | sort -n)"

unite_str=""
tmp_file_t="$(mktemp)"
for f in $tmp_dir/*
do
	echo "$f"
	echo "$f" | cut -d '/' -f 4 >> "$tmp_file_t"
done

sort -n "$tmp_file_t" > "$tmp_file_one" 

while read line; do
	echo "$line"
	unite_str="$unite_str $tmp_dir/$line"
done < "$tmp_file_one"

echo "$unite_str"
echo "uniting"
pdfunite $unite_str os-book.pdf

rm -rf "$tmp_dir" "$tmp_file_one" "$tmp_file_two" "$tmp_file_t"
