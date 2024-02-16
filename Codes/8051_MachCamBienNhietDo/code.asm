led4 bit p2.3
led3 bit p2.2
led2 bit p2.1
led1 bit p2.0

org 000h
main: 
lcall cdoi
lcall bcd_7doan
lcall hienthi
jmp main

cdoi:
clr p3.1
jnb p3.2,$    
setb p3.1
clr p3.0
mov a,p1
ret

bcd_7doan:
mov b,#10
div ab
mov 10h,b     
mov 11h,a  

mov dptr,#900h
mov a,10h
movc a,@a + dptr
mov 20h,a     
mov a,11h
movc a,@a + dptr
mov 21h,a    
ret

hienthi: 
mov p0,21h
setb led1
lcall delay
anl p2,#0h   

mov p0,20h
setb led2
lcall delay
anl p2,#0h

mov p0,#09ch
setb led3
lcall delay
anl p2,#0h

mov p0,#0c6h
setb led4
lcall delay
anl p2,#0h

ret
delay: mov 7fh,#100
djnz 7fh,$
ret
org 900h
db 0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90
END