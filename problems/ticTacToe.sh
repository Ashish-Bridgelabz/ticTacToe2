#!/bin/bash -x
#DISPLAYE THE WELCOME STATEMENT
echo "Welcome to the Tic Tac Toe Game"
null=" "
declare -a board
board=(" " " " " " " " " " " " " " " " " ")
function resultingBoard()
{
	echo "${board[0]} | ${board[1]} | ${board[2]}"
	echo "----------"
	echo "${board[3]} | ${board[4]} | ${board[5]}"
	echo "----------"
	echo "${board[6]} | ${board[7]} | ${board[6]}"
}
#CALL THE FUNCTION
resultingBoard
{
	#GENERATING RANDOM VALUE TO ASSIGN PLAYER O OR X
	randomNumber=$((RANDOM%2))
	case $randomNumber in
		0)
			player="X"
			computer="O";;
		1)
			player="O"
			computer="X";;
esac
}
