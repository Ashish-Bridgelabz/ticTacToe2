
#!/bin/bash -x
#DISPLAYE THE WELCOME STATEMENT
echo "Welcome to the Tic Tac Toe Game"
null=" "
declare -a board
board=(" " " " " " " " " " " " " " " " " ")
function displayBoard()
{
	echo "${board[0]} | ${board[1]} | ${board[2]}"
	echo "----------"
	echo "${board[3]} | ${board[4]} | ${board[5]}"
	echo "----------"
	echo "${board[6]} | ${board[7]} | ${board[8]}"
}
#ASSINING LETTER TO PLAYER AND COMPUTER
function assiningLetter()
{
	#GENERATING RANDOM VALUE TO ASSIGN O OR X
	randomNumber=$((RANDOM%2))
	case $randomNumber in
		0)
			player="X"
			computer="O";;
		1)
			player="O"
			computer="X";;
	esac
	checkToss
}
#LOGIC FOR VALID CELL
function validCellNumber()
{
   echo "Enter the valid number from 0 to 8 and choose position" 
   read data
   if (($data>=0 && $data<=8))
   then
      if [[ "${board[data]}"!=X || "${board[data]}"!=O ]]
      then
         board[$data]="$player"
      else
         echo "Enter valid input\n"
			validCellNumber
      fi
   fi

displayBoard
}
#LOGIC FOR TO ASSIGN FIRST CHANCE
function checkToss()
{
	#GENERATING RANDOM VALUE 0 FOR PALYER 1 FOR COMPUTER
	toss=$((RANDOM%2))
	case $toss in
		0)
			echo "Player play first\n"
			echo "Player assinged: $player\nComputer assinged: $computer";;
		1)
			echo "Computer play first\n"
			echo "Computer assinged: $computer\nPlayer assinged: $player";;
	esac

}
assiningLetter
#LOGIC FOR WIN DROW AND NEXT CHANCE
function gameOver()
{
	if [[ "${board[0]} ${board[1]} ${board[2]}" = "X X X" ||  "${board[0]} ${board[1]} ${board[2]}" = "O O O" ]]
	then
		echo result="Win" 
	elif [[ "${board[3]} ${board[4]} ${board[5]}"="X X X"||"${board[3]} ${board[4]} ${board[5]}"="O O O " ]]
	then
		result="Win"
	elif [[ "${board[6]} ${board[7]} ${board[8]}"="X X X"||"${board[6]} ${board[7]} ${board[8]}"="O O O " ]]
	then
		result="Win"
	elif [[ "${board[0]} ${board[3]} ${board[6]}"="X X X"||"${board[0]} ${board[3]} ${board[6]}"="O O O " ]]
	then		result="Win"
	elif [[ "${board[1]} ${board[4]} ${board[7]}"="X X X"||"${board[1]} ${board[4]} ${board[7]}"="O O O " ]]
	then
		result="Win"
	elif [[ "${board[2]} ${board[5]} ${board[8]}"="X X X"||"${board[2]} ${board[5]} ${board[8]}"="O O O " ]]
	then
		result="Win"
	elif [[ "${board[0]} ${board[4]} ${board[8]}"="X X X"||"${board[0]} ${board[4]} ${board[8]}"="O O O " ]]
	then
		result="Win"
	elif [[ "${board[6]} ${board[4]} ${board[2]}"="X X X"||"${board[6]} ${board[4]} ${board[2]}"="O O O " ]]
 	then
		result="Win"
	else
		temp=0
		for((index=0; index<${#board[@]}; index++))
		do
			if [[ "${board[$index]}"!=X || "${board[$index]}"!=O ]]
			then
				temp=1
			fi
		done
			if(($temp==1))
			then
				result="Change"
			else
				result="Draw"
			fi
	fi
			echo $result
}
while ((0==0))
do
displayBoard
validCellNumber
result="$(gameOver)"
#echo "$result"
done


	






