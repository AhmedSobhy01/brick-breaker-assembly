EXTRN PADDLE_X:WORD
EXTRN PADDLE1_X:WORD
EXTRN PADDLE1_VEL_X:WORD
EXTRN PADDLE2_X:WORD
EXTRN PADDLE2_VEL_X:WORD
EXTRN drawPaddle:FAR
EXTRN clearPaddle:FAR

PUBLIC movePaddle1
PUBLIC movePaddle2

.MODEL small
.386

.DATA
	PADDLE_WIDTH EQU 50

.CODE
movePaddle1 PROC FAR

	CMP PADDLE1_VEL_X,0
	JE skipMovePaddle1

	MOV AX, PADDLE1_X
	ADD AX, PADDLE1_VEL_X
	CMP AX, 0
	JL skipMovePaddle1
	CMP AX, 160 - PADDLE_WIDTH
	JG skipMovePaddle1

	MOV AX, PADDLE1_X
	MOV PADDLE_X, AX
	CALL clearPaddle

	MOV AX, PADDLE1_X
	ADD AX, PADDLE1_VEL_X
	MOV PADDLE1_X, AX
	MOV PADDLE_X, AX
	CALL drawPaddle

skipMovePaddle1:
	RET

movePaddle1 ENDP

movePaddle2 PROC FAR

	CMP PADDLE2_VEL_X,0
	JE skipMovePaddle2

	MOV AX, PADDLE2_X
	ADD AX, PADDLE2_VEL_X
	CMP AX, 0
	JL skipMovePaddle2
	CMP AX, 160 - PADDLE_WIDTH
	JG skipMovePaddle2

	MOV AX, PADDLE2_X
	MOV PADDLE_X, AX
	CALL clearPaddle

	MOV AX, PADDLE2_X
	ADD AX, PADDLE2_VEL_X
	MOV PADDLE2_X, AX
	MOV PADDLE_X, AX
	CALL drawPaddle

skipMovePaddle2:
	RET

movePaddle2 ENDP
END