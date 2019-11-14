#!/bin/bash

## Brent Moran: The purpose is to take a file and output
## some information about file in the argument.

## usage: info.sh directory file_in_directory

dir=$1
val1=$2

if [[ $1 == "-h" || $1 == "--help" ]]   ##Displays usage to user if they request it with -h or --help
 then
   echo ""
   echo "usage: $0 directory file_in_directory"
   echo ""
   
   exit 0
fi

if [[ $#<2 || $#>2 ]]       ##Confirm correct number of arguments.
then
  echo ""
  echo "You need to  have two arguments and you have $#"
  echo "usage: $0  directory file_in_directory"
  echo ""
  
  exit 1
fi

if [[ -d $1 ]]       ##This is to confirm the first argument is a directory. 
then
  echo "Directory was found"

else
  echo ""
  echo "directory does not exist, or the arguments are in the wrong format"
  echo "usage: $0 directory file_in_directory"
  echo "" 

  exit 1
fi

cd $dir

if [[ -e $2 ]]      ##This confirms second argument is a file.
then
  echo "File was found"

else
  echo ""
  echo "file does not exist, or the arguments are in the wrong format"
  echo "usage: $0 directory file_in_directory"
  echo ""

  exit 1
fi 
						
echo ""
echo "The name of our script is: $0"
echo "usage: $0 directory file_in_directory"
echo ""
echo "Current date and time:"
date
echo ""
echo "The name of our user is: "
echo $USER
echo ""
echo "Current working directroy is: "
echo $PWD
echo ""
echo "The name of the UNIX machine is: "
hostname
echo ""
echo "The login shell is: "
echo $SHELL 
echo "The current shell we are in is: "
echo $0
echo ""
echo "The content of the required file is: "
cat $2
echo "The number of lines in the file is: "
cat $2 | wc -l
echo ""
echo "Listing of current Directory is: "
ls -a
echo ""
echo "The number of parmameter of the script is: "
echo $#
echo ""
echo "The calender for October of 2019 is shown below: "
cal 10 2019
echo ""
echo "The disk usage is: "
du
echo ""
echo "The current number of users on the system is: "
who | wc -l
echo ""
echo "The time as of right now is: "
date +"%T"                             ##I found this on cybercity.biz

cd ..
exit 0
