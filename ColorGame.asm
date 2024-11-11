;Authors: Chris Pinto-Font, Tommy G

INCLUDE Irvine32.inc

.data
colors BYTE 0Fh, 1Eh, 2Ch, 4Ah, 6Dh, 5Eh, 9Bh; Array of color codes
sequence BYTE 100 DUP(? ); Randomized color sequence(up to 100 colors)
userInput BYTE 100 DUP(? ); User's input
gameOverMsg BYTE "Game Over! Starting a new round...", 0
winMsg BYTE "Next Round", 0
scoreMsg BYTE "Your current score is: ", 0
levelMsg BYTE "Level: ", 0
score DWORD 0; Player score
level DWORD 1; Current level
numColors DWORD 3 ;Intital amt of colors

.code
main PROC
call Clrscr ;Clear screen

;Initialize values for run
GameStart: 
mov numColors, 3 ;Start with 3 colors
mov score, 0 ;reset score
mov level, 1 ;reset level
