        format PE64

section '.text' code executable readable


        mov rcx,1000
        call [Sleep]

        mov rcx, s2
        mov rdx, s1
        call [printf]

        mov rcx,0
        call [ExitProcess]


section '.data' data readable writeable

        s1 db "Test String",0
        s2 db "%s",0

section '.idata' import data readable writeable


        dd 0,0,0,RVA kernel_name,RVA kernel_table
        dd 0,0,0,RVA cname,RVA c_table
        dd 0,0,0,0,0
        
        kernel_table:
                ExitProcess dq RVA _ExitProcess
                Sleep dq RVA _Sleep
                dq 0
                
                
        c_table:
                puts dq RVA _puts       
                printf dq RVA _printf
                strlen dq RVA _strlen
                dq 0

        
        kernel_name db 'KERNEL32.DLL',0
        cname db 'MSVCRT.DLL',0

        _ExitProcess dw 0
                db 'ExitProcess',0
        _Sleep dw 0
                db 'Sleep',0
        _puts dw 0 
                db 'puts',0
        _printf dw 0
                db 'printf',0
        _strlen dw 0 
                db 'strlen',0

        
