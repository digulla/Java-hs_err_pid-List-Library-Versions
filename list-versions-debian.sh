#!/bin/bash

grep /usr/lib "$1" |
cut -d/ -f2- |
sort -u |
( while read lib ; do
	lib="/$lib"

	dpkg -S "$lib" | cut -d: -f1
done ; ) |
sort -u |
while read package ; do 
	version=$(dpkg --status "$package" | grep "Version:" | cut -d: -f2)

	echo "$package $version"
done
