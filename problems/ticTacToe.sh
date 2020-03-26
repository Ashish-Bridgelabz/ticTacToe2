#!/bin/bash -x
#DISPLAYE THE WELCOME STATEMENT
echo "Welcome to the Tic Tac Toe Game"
EMPTY=" "
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
	random=$((RANDOM%2+1))
	case $random in
		1)
			player="X"
			computer="O";;
		2)
			player="O"
			computer="X";;
	esac
	checkToss
}
#CHOOSE VALID CELL
function playerTurn()
{
	echo "Enter index 0 to 8 to choose position in board"
	read userInput
		if [[ $userInput -lt 9 ]] && [[ ${board[$userInput]} != "X" && ${board[$userInput]} != "O" ]]
		then
			echo "Player turn"
			board[$userInput]="$player"
		else
			echo "Enter valid input"
			playerTurn 
		fi
	displayBoard
}
#LOGIC FOR TO ASSIGN FIRST CHANCE
function checkToss()
{
	#GENERATING RANDOM VALUE 1 FOR PALYER 2 FOR COMPUTER
	toss=$((RANDOM%2+1))
	case $toss in
		1)
			echo " Player play first"
			echo "Player assinged: $player\nComputer assinged: $computer"
			displayBoard;;
		2)
			echo "Computer play first"
			echo "Computer assinged: $computer\nPlayer assinged: $player"
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
		result="Change"
	else
		result="Draw"
	fi
	fi
	echo $result
}
#COMPUTER FILL AUTOMATIC TO WIN
function computerFillAutomatic()
{
	compPlay=0
	local	rowIndex=0
	local columnIndex=0
	#CHECKING FOR ROWS
	while(($rowIndex<8))
	do
		if [[ ${board[$rowIndex]} == $computer && ${board[$(($rowIndex+1))]} == $computer && ${board[$(($rowIndex+2))]} == $EMPTY ]]
		then
			board[$(($rowIndex+2))]=$computer
			compPlay=1
			return
		elif [[ ${board[$rowIndex]} == $computer && ${board[$(($rowIndex+2))]} == $computer && ${board[$(($rowIndex+1))]} == $EMPTY ]]
		then
			board[$(($rowIndex+1))]=$computer
			compPlay=1
			return
		elif [[ ${board[$(($rowIndex+2))]} == $computer && ${board[$(($rowIndex+1))]} == $computer && ${board[$rowIndex]} == $EMPTY ]]
		then
			board[$rowIndex]=$computer
			compPlay=1
			return
		fi
		rowIndex=$(($rowIndex+3))
	done
	#CHECKING FOR COLUMNS
	while(($columnIndex<8))
	do
		if [[ ${board[$columnIndex]} == $computer && ${board[$(($columnIndex+3))]} == $computer && ${board[$(($columnIndex+6))]} == $EMPTY ]]
		then
			board[$(($columnIndex+6))]=$computer
			compPlay=1
			return
		elif [[ ${board[$columnIndex]} == $computer && ${board[$(($columnIndex+6))]} == $computer && ${board[$(($columnIndex+3))]} == $EMPTY ]]
		then
			board[$(($columnIndex+3))]=$computer
			compPlay=1
		return
		elif [[ ${board[$(($columnIndex+3))]} == $computer && ${board[$(($columnIndex+6))]} == $computer && ${board[$columnIndex]} == $EMPTY ]]
		then
			board[$columnIndex]=$computer
			compPlay=1
			return
		fi
		columnIndex=$(($columnIndex+1))
	done
	#CHECKING FOR  \  DIAGONAL
	if [[ ${board[0]} == $computer && ${board[4]} == $computer && ${board[8]} == $EMPTY ]]
	then
		board[8]=$computer
		compPlay=1
		return
	elif [[ ${board[0]} == $computer && ${board[8]} == $computer && ${board[4]} == $EMPTY ]]
	then
		board[4]=$computer
		compPlay=1
		return
	elif [[ ${board[8]} == $computer && ${board[4]} == $computer && ${board[0]} == $EMPTY ]]
	then
		board[0]=$computer
		compPlay=1
		return
	fi
	#CHECKING FOR  /  DIAGONAL
	if [[ ${board[2]} == $computer && ${board[4]} == $computer && ${board[6]} == $EMPTY ]]
	then
		board[6]=$computer
		compPlay=1
		return
	elif [[ ${board[2]} == $computer && ${board[6]} == $computer && ${board[4]} == $EMPTY ]]
	then
		board[4]=$computer
		compPlay=1
		return
	elif [[ ${board[6]} == $computer && ${board[4]} == $computer && ${board[2]} == $EMPTY ]]
	then
		board[2]=$computer
		compPlay=1
		return
	fi
}
#LOGIC FOR IF OPPONENT CAN WIN THEN BLOCK IT
function blockPlayerWin()
{
	local rowIndex=0
	local columnIndex=0
	compPlay=0
	#CHECKING FOR ROWS
	while(($rowIndex<8))
	do
		if [[ ${board[$rowIndex]} == $player && ${board[$(($rowIndex+1))]} == $player && ${board[$(($rowIndex+2))]} == $EMPTY ]]
		then
			board[$(($rowIndex+2))]=$computer
			compPlay=1
			return
		elif [[ ${board[$rowIndex]} == $player && ${board[$(($rowIndex+2))]} == $player && ${board[$(($rowIndex+1))]} == $EMPTY ]]
		then
			board[$(($rowIndex+1))]=$computer
			compPlay=1
			return
		elif [[ ${board[$(($rowIndex+2))]} == $player && ${board[$(($rowIndex+1))]} == $player && ${board[$rowIndex]} == $EMPTY ]]
		then
			board[$rowIndex]=$computer
			compPlay=1
			return
		fi
			rowIndex=$(($rowIndex+3))
	done
	#CHECKING FOR COLUMNS
	while(($columnIndex<8))
	do
		if [[ ${board[$columnIndex]} == $player && ${board[$(($columnIndex+3))]} == $player && ${board[$(($columnIndex+6))]} == $EMPTY ]]
		then
			board[$(($columnIndex+6))]=$computer
			compPlay=1
			return
		elif [[ ${board[$columnIndex]} == $player && ${board[$(($columnIndex+6))]} == $player && ${board[$(($columnIndex+3))]} == $EMPTY ]]
		then
			board[$(($columnIndex+3))]=$computer
			compPlay=1
			return
		elif [[ ${board[$(($columnIndex+3))]} == $player && ${display[$(($columnIndex+6))]} == $player && ${board[$columnIndex]} == $EMPTY ]]
		then
			board[$columnIndex]=$computer
			compPlay=1
			return
		fi
			columnIndex=$(($columnIndex+1))
	done
	#CHECKING FOR \ DIAGONAL
	if [[ ${board[0]} == $player && ${board[4]} == $player && ${board[8]} == $EMPTY ]]
	then
		board[8]=$computer
		compPlay=1
		return
	elif [[ ${board[0]} == $player && ${board[8]} == $player && ${board[4]} == $EMPTY ]]
	then
		board[4]=$computer
		compPlay=1
		return
	elif [[ ${board[8]} == $player && ${board[4]} == $player && ${board[0]} == $EMPTY ]]
	then
		board[0]=$computer
		compPlay=1
		return
	fi
	#CHECKING FOR / DIAGONAL
	if [[ ${board[2]} == $player && ${board[4]} == $player && ${board[6]} == $EMPTY ]]
	then
		board[6]=$computer
		compPlay=1
		return
	elif [[ ${board[2]} == $player && ${board[6]} == $player && ${board[4]} == $EMPTY ]]
	then
		board[4]=$computer
		compPlay=1
		return
	elif [[ ${board[6]} == $player && ${board[4]} == $player && ${board[2]} == $EMPTY ]]
	then
		board[2]=$computer
		compPlay=1
		return
	fi
}

#LOGIC TO FILL IN CORNER
function fillCorner()
{
	randomCorner=$((RANDOM%4))
	case $randomCorner in
		0)
			if [[ ${board[0]} == $EMPTY ]]
			then
				display[0]=$computer
				compPlay=1
				return
			else
				fillCorner $player
			fi
			;;
		1)
			if [[ ${board[2]} == $EMPTY ]]
			then
				board[2]=$computer
				compPlay=1
			 return
			else
				fillCorner $player
			fi
			;;
		2)
			if [[ ${board[6]} == $EMPTY ]]
			then
				board[6]=$computer
				compPlay=1
				return
			else
				fillCorner $player
			fi
			;;
		3)
			if [[ ${board[8]} == $EMPTY ]]
			then
				board[2]=$computer
				compPlay=1
				return
			else
				fillCorner $player
			fi
	esac
}

#LOGIC FOR COMPUTER TURN
function computerTurn()
{
	compPlay=0
	computerFillAutomatic
	if(($compPlay==0))
	then
		blockPlayerWin
	fi
	if(($compPlay==0))
	then
		fillCorner
	fi
	if(($compPlay==0))
	then
		computerPlay=$((RANDOM%8))
		if [[ ${board[$computerPlay]} != "X" ]] && [[ ${board[$computerPlay]} != "O" ]]
		then
			echo "Computer turn"
			board[$computerPlay]="$computer"
	else
			computerTurn $computer
		fi
	fi
displayBoard
}

#LOGIC FOR TO PLAY UPTO WIN OR DRAW
function winOrDraw()
{
	temp=0
	if [[ "$tossComputer" = "computer" ]]
	then
		temp=1
	fi
	while (( 0==0 ))
	do
		if(( $temp%2!=0 ))
		then
			computerTurn
			result="$(gameOver $player)"
			if [[ $result == "Win" ||  $result == "Draw" ]]
			then
				echo "Computer $result"
				break
			fi
			else
				playerTurn
				result="$(gameOver $computer)"
			if [[ $result == "Win"  ||  $result == "Draw" ]]
			then
				echo "Player $result"
				break
			fi
		fi
		temp=$(($temp+1))
	done
}
displayBoard
assiningLetter
winOrDraw
