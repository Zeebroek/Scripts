#!/bin/bash
# List my scripts alphabetical with their description

scripts=($(ls))	# get all script names
for ((i=0; i < ${#scripts[@]}; i++))
do
	# remove the .sh extension from the filename
	scripts[$i]=$(echo ${scripts[$i]} | cut -d. -f1)
done
# echo ${scripts[*]}

name="test"

for script in "${scripts[@]}"
do
	if [ $script = $name ]; then
		echo "[ERROR] Duplicate name" 
		echo "A script with this name already exist. Please choose a different name!"
	fi	
done

function script_name_exists {
	
	scripts=($(ls))				# get all script names
  	for ((i=0; i < ${#scripts[@]}; i++))	# loop through script names
  	do
        	# remove the .sh extension from the script name
        	scripts[$i]=$(echo ${scripts[$i]} | cut -d. -f1)
  	done

	for script in "${scripts[@]}"
 	do
		if [ $script = $name ]; then
 			local return="[ERROR] Duplicate name"
 		fi
	done

	echo "$return"
}

result=$(script_name_exists)
echo $result
