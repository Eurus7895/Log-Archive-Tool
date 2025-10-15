#!/bin/bash

compress_list_file(){
	directory=$1
	if [ ! -d "$directory" ]; then
		echo "Input is not a directory"
	fi	
	
	if [ -z $(ls $directory) ]; then
		echo "Directory is empty"
	fi
	
	output_name="logs_$(date +%Y%m%d_%H%M%S).tar.gz"
	tar -czvf $output_name -C $directory .
	
	if [ ! -e $  ]; then
		echo "Fail to create ${output_name}"
	fi
	echo "Compress form ${$directory} to ${output_name} successfully"
}


main(){
	compress_list_file "$1"
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
        main "$@"
fi
