### FUNCTIONS
runFunc1 ()
{
 echo; echo
 echo "-- Running audit --"
 echo "Device name: $1"
 echo "Command: $2"
 echo "Username: $3"
 echo "Password: $4"
 echo; echo -n "Press any key to continue..."; read
}

runFunc2 ()
{
 echo
 echo "-- Comparing files --"
 echo "File1: $1"
 echo "File2: $2"
 if [ ! -f "$1" ]; then
  echo "Invalid file: $1";
 elif [ ! -f "$2" ]; then
  echo "Invalid file: $2";
 else
  sdiff -s $0 $1
 fi
 echo; echo -n "Press any key to continue..."; read
}

runFunc3 ()
{
 echo
 echo "-- Searching syslog --"
 if [ ! -f "$1" ]; then
  echo "Invalid file: $1";
 else
  grep "$2" "$1"
 fi 
 echo; echo -n "Press any key to continue..."; read
}

runFunc4 ()
{
 echo
 echo "-- Creating backup cron --"
 echo "Device name: $1"
 echo "Schedule: $2"
 echo; echo -n "Press any key to continue..."; read
}

runFunc5 ()
{
 echo
 echo "-- Running snmpwalk --"
 echo "Device name: $1"
 echo "SNMP Command: $2"
 echo; echo -n "Press any key to continue..."; read
}

runFunc6 ()
{
 echo
 echo "-- Sanitizing show run --"
 echo "Device name: $1"
 echo "SNMP Command: $2"
 echo; echo -n "Press any key to continue..."; read
}


### MAIN START
while [ 0 ];
do

 ## Display menu options
 echo
 echo "[ --- NTW Admin Menu -- ]"
 echo "1] Run Audit"
 echo "2] Compare Files"
 echo "3] Syslog Pattern Search"
 echo "4] Create Backup Cron for NTW device"
 echo "5] Run SNMPWALK"
 echo "6] Sanitize 'SHOW RUN'"
 echo "q] Exit"
 echo -n "choose: "
 read choose

 case "$choose" in 
 1) ## Run Audit
	echo -n "Enter Device name: "
	read inDeviceName
	echo -n "Enter Command: "
	read inAuditCommand
	echo -n "Enter Username: "
	read inUsername
	echo -n "Enter Password: "
	read -s inPassword
	runFunc1 "$inDeviceName" "$inAuditCommand" "$inUsername" "$inPassword"
	;;

 2) ## Compare Files 	
	echo -n "Enter File1: "
	read inFile1
	echo -n "Enter File2: "
	read inFile2
	runFunc2 "$inFile1" "$inFile1"
	;;

 3) ## Syslog Pattern Search
	echo -n "Enter File to search: "
	read inFile1
	echo -n "Enter Pattern to search: "
	read inPattern
	runFunc3 "$inFile1" "$inPattern"
	;;

 4) ## Create Backup Cron for NTW device
	echo -n "Enter Device name: "
	read inDeviceName
	echo -n "Enter Schedule: "
	read inSchedule
	runFunc4 "$inDeviceName" "$inSchedule"
	;;

 5) ## Run SNMPWALK
	echo -n "Enter Device name: "
	read inDeviceName
	echo -n "Enter SNMP Command: "
	read inSNMPCommand
	runFunc5 "$inDeviceName" "$inSNMPCommand"
	;;

 6) ## Sanitize 'SHOW RUN'
	echo -n "Enter Device name: "
	read inDeviceName
	echo -n "Enter Command: "
	read inCommand
	runFunc6 "$inDeviceName" "$inCommand"
	;;
	
 q) exit 0;;
 
 esac
 
done 