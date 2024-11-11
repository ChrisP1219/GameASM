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
inputBuffer BYTE 5 DUP (0) ;user input buff

.code
main PROC
call Clrscr ;Clear screen

;Initialize values for run
GameStart: 
mov numColors, 3 ;Start with 3 colors
mov score, 0 ;reset score
mov level, 1 ;reset level

NewRound :
; Randomize the color sequence
call RandomizeColors

RandomizeColors PROC
mov ecx, numColors ;num of colors in sequence
mov esi, OFFSET sequence

RandomLoop :
call RandomRange ;gen rando num
movzx eax, al
and eax, 7; restrict 0-7
mov[esi], al ;store rando color index
inc esi
loop RandomLoop
ret
RandomizeColors ENDP

;gen rando num
RandomRange PROC
mov eax, numColors
call Randomize
ret
RandomRange ENDP


; Show the color sequence
call DisplayColors

; Get user input
call GetUserInput

