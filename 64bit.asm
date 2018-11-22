; USE THIS FOR THE HW
;Read 10 ints
;Print: Largest, Smallest, and Sum

segment .data
	fmt_print_large	db	"Largest: %d",10,0
	fmt_s	db	"%d",0
	fmt_print_small	db	"Smallest: %d",10,0
	fmt_print_sum	db	"Sum: %d",10,0
	

segment .bss
	nums	resd	10
	

segment .text
	global  main
	extern 	scanf
	extern 	printf

main:
	push	rbp
	mov		rbp, rsp
	; ********** CODE STARTS HERE **********
;; ---- Read the 10 ints-----------------
	mov 	rbx, 0
	read_loop_top:
	cmp		rbx, 10
	jge		read_loop_end
		mov		rdi, fmt_s
		lea		rsi, [nums + rbx*4]
		call	scanf
	inc 	rbx
	jmp		read_loop_top
	read_loop_end:
;;------- End read ints ----------------

;;;;;	SORT	;;;;;;;;;;;;;;;;;;;;;;;;
	
	mov		rbx, 0
	sort_outer_top:
	cmp		rbx, 10
	jge		sort_outer_end

		mov		rcx, 0
		sort_inner_top:
		cmp		rcx, 10
		jge		sort_inner_end
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; INSIDE OF BOTH FOR LOOPS	
			
			mov		esi, DWORD [nums + rbx * 4]
			mov		edi, DWORD [nums + rcx * 4]
			cmp		esi, edi
			jge		no_swap
				mov		DWORD [nums + rbx*4], edi
				mov		DWORD [nums + rcx*4], esi
			no_swap:			

				
		inc 	rcx
		jmp		sort_inner_top
		sort_inner_end:

	inc 	rbx
	jmp		sort_outer_top
	sort_outer_end:

;;;;;;;;;; END SORT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;; print smallest;;;;;;;;;;;;;;;;;;;;;;

	mov		esi, DWORD [nums]			; first val in array
	mov		rdi, fmt_print_small
	call 	printf
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	
;-------- print largest ----------------------	
	mov		esi, DWORD [nums + 36]		; last val in array
	mov		rdi, fmt_print_large
	call	printf


;--------------------------------------------	


;________________Sum_____________

	; add 10 integers
	; put the ints into  RSI
	xor		rsi, rsi
	mov		rbx, 0
	print_loop_top:
	cmp		rbx, 10
	jge		print_loop_end
		mov		edi, DWORD [nums+ rbx*4]
		add		esi, edi		
	inc		rbx
	jmp 	print_loop_top
	print_loop_end:


	mov 	rdi, fmt_print_sum
	call	printf

	
;______________________________________________

	

	; *********** CODE ENDS HERE ***********
	mov		rax, 0
	mov		rsp, rbp
	pop		rbp
	ret











