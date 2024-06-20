    push 0
    push m
    push string
    push 0
    call [MessageBox]


   push 45
	  push fstr
	  call [printf]
		
  	push 0
	  call [ExitProcess]
    

   string db "test",0
   m db "capture!",0
   fstr db "%d ",0
