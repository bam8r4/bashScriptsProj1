#!/bin/bash 

##Name:Brent Moran
##Purpose:To take a students firstname lastname and test scores.
##Then determine if their grade was high enough to pass the course.

##usage: $0 firstname lastname [any_number_of_testscores]
  
firstname="$1"   ##We are going to use the shift command so we are saving the first argument.
lastname="$2"    ##Variable made for the same reasons as the firstname variable.

sum=0            ##We need to keep a running sum of test scores.


if [[ $1 == "-h" || $1 == "--help" ]]     ##display usage if user ask for it.
 then
   echo "usage: $0 firstname lastname [any_number_of_testscores]"

   exit 0

fi


##Were going to check to see that both names entered are actually names.
##I found a similar argument to the one below on stack overflow and modifed it for our use.

if [[ "$1" =~ [^a-zA-Z\ ] ]]     
 then
   echo "You did not enter a valid first name."
   echo "usage: $0 firstname lastname [any_number_of_testscores]"
   
   exit 1

fi


if [[ "$2" =~ [^a-zA-Z\ ] ]]      ##Here we are checking the second argument to ensure its a valid last name.     
 then
   echo "You did not enter a valid last name."
   echo "usage: $0 firstname lastname [any_number_of_testscores]"
   
   exit 1

fi

shift 2        ##We are shifting left two places so we can use a for loop on numerical values only.


for x in "$@"                ##Now that we have shifted twice we can use a for loop to run through all of the remaining test scores.
do
 if ! [[ $x =~ ^[0-9]+([.][0-9]+)?$ ]]
  then  
        echo ""
        echo "One of the test scores you entered:$x was not a poitive numerical value."
        echo "You can enter any number of positive interger or float value."
        echo "usage: $0 firstname lastname [any_number_of_testscores]"
        echo ""        

        exit 1
  else

   interger=${x%.*}    ##We are cutting off all of the decimals associated with the test scores turning them into intergers.
   sum=$((sum+interger))   ##Keeping a runnnig total of of the test scores after they have been rounded down.     
          
 fi       

done

score=$((sum/$#))


echo ""
echo "The total sum of score is $sum"
echo "The number of test scores recieved $#"
echo "The average of the tests is  $score"

if [[ $score -ge 70 ]]
 then
   echo ""
   echo "Congratulation $firstname $lastnam, you passed the course with a score of $score!"
   echo ""
   
   exit 0
 
 else
   echo ""
   echo "Sorry, $firstname $lastname you failed the course with a score of $score."
   echo ""
   
fi

exit 0 
