#!/bin/bash

POSITIONAL=()
if [[ $# -eq 0 ]] 
then
	echo -e "\n\tmissing arguments\n"
	exit
fi

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
	-h|--help)
    HELP="$2"

    if [ -z "${HELP}" ]
   then
    echo -e "\n Usage : \n\trandompass -t ( password length ) -w ( password combination ) \n"
    exit
   else
   	    echo -e "\n  usage : \n\trandompass -h | --help \n"
        exit
   fi

    shift 
     
    ;;

    -l|--length)
    len=false
    LENGTH="$2"
    
if ! [ -z ${LENGTH} ] 
	then

  	if  [[ ${LENGTH} = [0-9]* ]] 
  		then

		if [ ${LENGTH} -lt 0 ] ||  [ ${LENGTH} -gt 10 ] || [ ${LENGTH} -eq 0 ]
		   then
	
			echo -e "\n\tinvalid argument length must be in (1..10)\n"
			len=false
			exit
		else
			#echo -e "\n\tvalid number\n"
			len=true

		fi
	else
		echo -e "\n\tStupid !! its not a number !\n"
		exit
	fi
else
	echo -e "\n\tmissig argument !\n"
	exit
fi

  
    shift 
    shift 
    ;;
    -w|--word)
    WORD="$2"

    word=false
    if ! [ -z ${WORD} ] 
	then
    if [[ ${WORD} =~ ^[a-zA-Z0-9]+$ ]]
    	then
    	#echo -e "\n\t Valid combination"
    	word=true
    else
    	echo -e "\n\tInvalid combination \n"
    	exit
    fi
    else
	echo -e "\n\tmissig argument !\n"
	exit
    fi

    shift 
    shift 
    ;;
    
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    echo -e "\n\tinvalid Option ==> $1\n"
    exit
    shift 
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

#echo -e "\n\t$len\n"
#echo -e "\n\t$word\n"
# he we go
#echo -e $((( $LENGTH + 0 )))
#echo -e ${WORD}
#echo -e "\n\t randompass will genrate the random passwords :\n\n"
#sleep 4

while [ $len  ] && [ $word  ]

echo ${WORD} | fold -w1 > hatem.txt && readarray a < hatem.txt  && rm hatem.txt
do
	mdp=""
for (( i=0; i<=(( $LENGTH -1 )); i++ ))
	do
	mdp+=` echo -en  "${a[$(( ( RANDOM %  (( ${#a[@]} - 1 )) )  + 1 ))]}" `
	done

	 echo -e $mdp 
done