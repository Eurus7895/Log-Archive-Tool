#!/bin/bash

compress_list_file(){
	directory=$1
	# Check if the input exist
	if [ ! -e "$directory" ]; then
		echo "Input is incorrect"
		# Return to 0 to inhibit more error message 
		return 0
	fi
	
	# Check if the input is directory as It can be a file
	if [ ! -d "$directory" ]; then
		echo "Input is not a directory"
		return 0
	fi	
	
	# Check the string returned from ls is empty or not
	if [ -z $(ls $directory) ]; then
		echo "Directory is empty"
		return 0
	fi
	
	output_name="logs_$(date +%Y%m%d_%H%M%S).tar.gz"

	# Archive and compress the folder
	# -c: create a new archive
	# -z: compress file by gzip
	# -v: show information of the file will be compressed
	# -f: choose the output file name
	tar -czvf $output_name -C $directory .
	
	if [ ! -e $output_name ]; then
		echo "Fail to create ${output_name}"
		return 0
	fi
	echo "Compress form ${$directory} to ${output_name} successfully"
	return 1
}


main(){
	compress_list_file "$1"
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
        main "$@"
fi
