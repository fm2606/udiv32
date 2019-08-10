@
@ udiv32:   unsigned 32 bit division
@
@ Algorithm used on page 183 of
@ "Modern Assembly Language Programming with the Arm Processor"
@ by Larry D. Pyeatt
@ 
@ Author: Curtis L. Lewis 
@ Date:  2019-08-10
@
@ On Entry:
@ r0 contains dividened
@ r1 contains divisor
@
@ Return:
@ r0 = quotient
@ r1 = remainder
@
@ Only LR is preserved
@
.global     udiv32

udiv32:
            push {lr}
            cmp r1, #0
            beq exit            @ exit if divide by zero

            mov r2, r1          @ r2 <-- r1 (divisor)
            mov r1, r0          @ r1 <-- r0 (dividend and remainder)
            mov r0, #0          @ initialize quotient to 0
            mov r3, #0          @ initialize counter 


@ mkgte:  make divisor greater than or equal
@
@ logically left shift divisor until divisor >= dividend
@ r2 >= r1
@
mkgte:
            cmp r2, r1          @ compare r2 to r1
            bge subdec          @ if r2 >= r1 subtract & decrement
            add r3, r3, #1      @ increment counter
            lsl r2, r2, #1      @ r2 < r1 so left shift r2 by 1 bit
            blt mkgte

subdec:     
            cmp r3, #0          
            blt exit            @ if r3 < 0 done
            cmp r2, r1
            lsl r0, r0, #1      @ shift left r0 regardless of compare results
            addls r0, r0, #1    @ if r2 <= r1 add 1 to quotient after shift
            subls r1, r1, r2    @ if r2 <= r1 then r1 = r1 - r2
            sub r3, r3, #1      @ decrement counter
            lsr r2, r2, #1      @ shift divisor to right by 1 bit
            bl subdec

            pop {lr}
exit:       bx  lr 
.end
