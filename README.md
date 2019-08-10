# udiv32
unsigned division in arm assembly armv7/armv8 (rpi 3B+)

Files:
my_udiv:  binary run $./my_udiv
test_udiv.s: test engine for udiv32 function
test_udiv.o: object file

udiv32.s: function that computes unsigend division
udiv32.o: object file

v_dec.o: object file (from "Assembly Language Using Raspberry Pi: A Hardware Software Bridge" by Robert Dunne; source listing on page 152)

Unsigned division algorithm from
"Modern Assembly Language Programming With ARM Processor" by Larry D. Pyeatt
on page 183

NOTE:
Returned result is only the quotient (in R0)
Remainder is in R1 but not displayed.

94 / 7 = 13 r 11
