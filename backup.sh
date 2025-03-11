#!/bin/bash

if [[ $# != 2 ]]
then
	echo "backup.sh target_directory_name destination_directory_name"
	exit
fi

if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
	echo "Invalid directory path provided"
	exit
fi

# [TASK 1]
targetDirectory=$1
destinationDirectory=$2

# [TASK 2]
echo "targetDirectory is $1"
echo "destinationDirectory is $2"

# [TASK 3]
currentTS=$(date +%s)

# [TASK 4]
backupFileName="backup-$currentTS.tar.gz"

# [TASK 5]
origAbsPath=$(pwd)

# [TASK 6]
cd $destinationDirectory
destAbsPath=$destinationDirectory

# [TASK 7]
cd $origAbsPath
cd $targetDirectory

# [TASK 8]
yesterdayTS=$(($currentTS - 24 * 60 * 60))

declare -a toBackup

for file in $(ls) # [TASK 9]
do
	if ((`date -r $file +%s` > $yesterdayTS)) 
	# [TASK 10]
	then
		toBackup+=($file) # [TASK 11]
	fi
done

# [TASK 12]
tar -czvf $backupFileName ${toBackup[@]}

# [TASK 13]
mv $backupFileName $destAbsPath 

