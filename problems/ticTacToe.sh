
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
   if (($data>0 && $data<=8))
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
displayBoard
assiningLetter
validCellNumber
checkToss
