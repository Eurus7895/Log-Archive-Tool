#!/bin/bash

compress_list_file(){
	directory=$1
	if [ ! -e "$directory" ]; then
		echo "Input is incorrect"
		return 0
	fi
	
	if [ ! -d "$directory" ]; then
		echo "Input is not a directory"
		return 0
	fi	
	
	if [ -z $(ls $directory) ]; then
		echo "Directory is empty"
		return 0
	fi
	
	output_name="logs_$(date +%Y%m%d_%H%M%S).tar.gz"
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
