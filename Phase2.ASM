	MOV	AL,90	;Address of variables

	MOV	BL,06	; # of Array Elementsstarting at 0
	MOV	[AL],BL	; i is stored at [90]

	INC	AL
	MOV	CL,80	; j for the for loop, init'd at the first element
	MOV	[AL],CL	; address of arr[i] stored at 51
	
	INC	AL	
	MOV	DL,81	; j+1 for the for loop init'd at 2nd element of array
	MOV	[AL],DL	;adress of arr[j] stored at 52

	INC	AL	
	MOV	[AL],DL	; temp variable

	CALL	30	;Call sort function

	HALT

	ORG 30		;Sort function
	MOV	AL,[91]	;AL is i
	MOV	BL,[92]	;BL is j
	
	JMP	InnerLoop

OuterLoop:	;Loops through the array until every element is moved largest to smallest
	MOV	CL,[90]
	DEC	CL	;Decrement outer loop counter
	MOV	AL,80
	MOV	BL,81	;Restart at the beginnng of the loop
	MOV	[90],CL	;Save new value back to 90
	CMP	CL,00	;are we finished?
	JZ	Skip	;Yes if 0
	JNZ	InnerLoop	;Else, no

InnerLoop:	;Moves thorugh the loop, compares and decides what to do
	MOV	CL,[AL]	;Arr[j]
	MOV	DL,[BL]	;Arr[j+1]
	CMP	CL,DL	;is Arr[j] > Arr[j+1]
	JNS	Swap	;if so, swap
	JS	Next	;else, begin next iteration

Swap:
	MOV	[AL],DL	;arr[j] = arr[j+1]
	MOV	[BL],CL	; Arr[j+1] = arr[j]
	JMP	Next

Next:
	;Check if we're at the end of the inner loop
	MOV	CL,[90]
	ADD	CL,80
	CMP	BL,CL	;Are we at the last non-sorted elem of the arr
	JZ	OuterLoop ;If so, jump there
	INC	AL
	INC	BL
	JMP InnerLoop	;Continue the innerLoop

Skip:
	RET
	

	ORG	80	;Orignal array, storing random numbers
	DB	17	; 23
	DB	0E	;14
	DB	F3	;-13
	DB	01	;01
	DB	FE	; -2
	DB	47	;71
	DB	5D	;93
	DB	FF	;Terminator

	;Organized values in RAM: F3 FE 01 0E 17 47 5D
	END


	