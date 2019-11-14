#!/bin/bash

## Name: Brent Moran
## Purpose of script: To take an interger between 10-100 and find its lowest prime factor.
## Since the root of 100 is ten we will only need prime numbers less than 10.

## usage: factor.sh [10-100]


if [[ $1 == "-h" || $1 == "--help" ]]    ##Display usage to user if they request it.
 then
  echo ""
  echo "usage: No usage requirments. "
  echo ""

  exit 0

fi

echo "Input an interger between 10 and 100"
read input

if [[ "$input" == [a-zA-Z] ]]    ##Ensure only intergers will be put into the argument.
 then
  echo "You need to enter a valid argument to run the file"
  
  exit 1
fi

if [[ $input -le 9 || $input -ge 101 ]]                ##Confirm that the argument is withing the range of legal values.
 then
   echo ""
   echo "Your argument is out of range"
   echo ""

   exit 1

fi

##We must do our checks from lowest to highest. ie 2 then 3 then 5 then 7.
##This is becuase we may get a number that is divisble by more than one prime.
##For example six. If we checked 3 before two our program would output 3 as the lowerst prime.
##We of course know this is not correct.



if [[ $(( input%2 )) = 0 ]]                 ##Checks to see if number is perfectly divisible by two.
 then
   echo ""
   echo "The smallest prime factor is 2"
   echo ""

 exit 0


elif [[ $(( input%3 )) = 0 ]]              ##Checks to see if divisible by three.
 then
   echo ""
   echo "The smallest prime factor is 3"
   echo ""

 exit 0


elif [[ $(( input%5 )) = 0 ]]              ##Checks to see if divisble by five.
 then
   echo ""
   echo "The smallest prime factor is 5"
   echo ""

 exit 0


elif [[ $(( input%7 )) = 0 ]]              ##Checks to see if divisible by seven.
 then
   echo ""
   echo "The smallest prime factor is 7"
   echo ""

 exit 0


else
  echo "" 
  echo "The number is prime"           ##In our range if its not divisible by 2,3,5,7 then it must be prime itself.
  echo ""

 exit 0

fi

exit 0
