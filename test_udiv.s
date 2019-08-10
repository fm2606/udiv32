
.global _start 

_start:
        mov   r0, #94
        mov   r1, #7
        bl    udiv32
        bl    v_dec

        mov r0, #0
        mov r7, #1
        svc 0
