#!/bin/bash
# Creates and opens new bash script in this directory

# Parameters
# ----------
script_name=$1
# ----------

function scriptname_is_duplicate {

        scripts=($(ls))                         # get all script names
        for ((i=0; i < ${#scripts[@]}; i++))    # loop through script names
        do
                # remove the .sh extension from the script name
                scripts[$i]=$(echo ${scripts[$i]} | cut -d. -f1)
        done
	
        for script in "${scripts[@]}"
        do
		echo $script
                if [ $script = $script_name ]; then
                       local error_msg="d"
			echo "exiting"
			exit 1
                fi
        done

        echo "$error_msg"
}

# if script name isn't emtpy and a script with that name doesn't already exist

#if [[ (! -z $script_name) && $(scriptname_is_duplicate; echo $?) -eq 0 ]] ; then
	
if [[ ! -z "$script_name" ]] ; then
 
	if [[ -z "$(scriptname_is_duplicate)" ]] ; then

		# Initialize
		cd ~/Scripts 			# make sure we are in the right directory
		touch $script_name.sh 		# create a new script with a name of choice
		chmod +x $script_name.sh 	# give executable permissions
	
		# Create content
		echo "#!/bin/bash" >> $script_name.sh
		echo "# Description new script \"$script_name\"" >> $script_name.sh
		echo "" >> $script_name.sh
		echo "# Parameters" >> $script_name.sh
		echo "# ----------" >> $script_name.sh
		echo "# first_parameter=\$1" >> $script_name.sh
		echo "# ..." >> $script_name.sh
		echo "# ----------" >> $script_name.sh
		echo "" >> $script_name.sh
	
		# Open script
		vim $script_name.sh
	
	else 

		echo "[ERROR] Existing script name"	
		echo "Please provide another name for your script!"
	fi

else
	echo "[ERROR] Empty script name"	
	echo "Please provide a name for your script!"
fi
