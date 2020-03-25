
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
	#GENERATING RANDOM VALUE TO ASSIGN PLAYER O OR X
	random=$((RANDOM%2))
	case $random in
		0)
			player="X"
			computer="O";;
		1)
			player="O"
			computer="X";;
	esac
	checkToss
}
#LOGIC FOR CHOOSE VALID CELL
function validCellNumber()
{
	echo "Enter index 0 to 8 to choose position in board"
	read data
	if(($data>=0 && $data<=8))
	then
			if [[ "${board[data]}"!="X" && "${board[data]}"!="O" ]]
			then
			#USING CLEAR TO CLEAN PREVIOUS PLAYED
			clear
			echo "Player turn\n"
			board[$data]="$player"
			displayBoard
			else
			echo "Enter valid input"
			validCellNumber $player
			fi
	fi
}
#LOGIC FOR TO ASSIGN FIRST CHANCE
function checkToss()
{
	#GENERATING RANDOM VALUE 1 FOR PALYER 2 FOR COMPUTER
	toss=$((RANDOM%2))
	case $toss in
		0)
			echo "Player play first"
			echo "Player assinged: $player and Computer assinged: $computer"
			displayBoard;;
		1)
			echo "Computer play first"
			echo "Computer assinged: $computer and Player assinged: $player"
			tossComputer="computer";;
	esac
}
#LOGIC FOR WIN  DRAW AND NEXT CHANCE
function gameOver()
{
	if [[ "${board[0]} ${board[1]} ${board[2]}" = "X X X" ||  "${board[0]} ${board[1]} ${board[2]}" = "O O O" ]]
	then
		result="Win"
	elif [[ "${board[3]} ${board[4]} ${board[5]}" = "X X X" ||  "${board[3]} ${board[4]} ${board[5]}" = "O O O" ]]
	then
		result="Win"
	elif [[ "${board[6]} ${board[7]} ${board[8]}" = "X X X" ||  "${board[6]} ${board[7]} ${board[8]}" = "O O O" ]]
	then
		result="Win"
	elif [[ "${board[0]} ${board[3]} ${board[6]}" = "X X X" ||  "${board[0]} ${board[3]} ${board[6]}" = "O O O" ]]
	then
		result="Win"
	elif [[ "${board[1]} ${board[4]} ${board[7]}" = "X X X" ||  "${board[1]} ${board[4]} ${board[7]}" = "O O O" ]]
	then
		result="Win"
	elif [[ "${board[2]} ${board[5]} ${board[8]}" = "X X X" ||  "${board[2]} ${board[5]} ${board[8]}" = "O O O" ]]
	then
		result="Win"
	elif [[ "${board[0]} ${board[4]} ${board[8]}" = "X X X" ||  "${board[0]} ${board[4]} ${board[8]}" = "O O O" ]]
	then
		result="Win"
	elif [[ "${board[6]} ${board[4]} ${board[2]}" = "X X X" ||  "${board[6]} ${board[4]} ${board[2]}" = "O O O" ]]
	then
		result="Win"
	else
		temp=0
		for(( index=0; index<${#board[@]}; index++ ))
		do
			if [[ ${board[$index]} != "X" && ${board[$index]} != "O" ]]
			then
				temp=1
			fi
		done
	if(( $temp==1 ))
	then
		result="Chance"
	else
		result="Draw"
	fi
	fi
	echo $result
}
#LOGIC FOR COMPUTER TURN
function computerTurn()
{
	computerPlay=$((RANDOM%8))
	if [[ ${board[$computerPlay]} != "X" ]] && [[ ${board[$computerPlay]} != "O" ]]
	then
		echo "Computer turn"
		board[$computerPlay]="$computer"
		displayBoard
	else
		computerTurn $computer
	fi
}
	#LOGIC FOR TO PLAY UPTO WIN OR DRAW
	assiningLetter
	temp=0
	if [[ "$tossComputer" = "computer" ]]
	then
		temp=1
	fi
	while (( 0==0 ))
	do
		if(( $temp%2==0 ))
		then
			validCellNumber
			result="$(gameOver $player)"
			if [[ $result == "Win" ||  $result == "Draw" ]]
			then
				echo " Player $result"
				break
			fi
		else
			computerTurn
			result="$(gameOver $computer)"
			if [[ $result == "Win"  ||  $result == "Draw" ]]
			then
				echo "Computer $result\n"
				break
			fi
		fi
			temp=$(($temp+1))
	done
displayBoard
