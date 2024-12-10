EXTRN PADDLE1_X:WORD
EXTRN PADDLE1_VEL_X:WORD
EXTRN PADDLE_X:WORD
EXTRN drawPaddle:FAR
EXTRN clearPaddle:FAR

PUBLIC movePaddle


.MODEL small
.386

.DATA
PADDLE_WIDTH EQU 50

.CODE
movePaddle PROC FAR

	cmp PADDLE1_VEL_X,0
	JE skipMovePaddle

	mov ax, PADDLE1_X
	ADD AX, PADDLE1_VEL_X
	CMP AX,0
	JL skipMovePaddle
	CMP AX,160 - PADDLE_WIDTH
	JG skipMovePaddle

	MOV AX, PADDLE1_X
	MOV PADDLE_X, AX
	CALL clearPaddle

	MOV AX, PADDLE1_X
	ADD AX, PADDLE1_VEL_X

	MOV PADDLE1_X, AX
	MOV PADDLE_X, AX
	CALL drawPaddle

skipMovePaddle:
	RET

movePaddle ENDP
END