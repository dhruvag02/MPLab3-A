.model small
.data
a db 04,02,08,05,03
n db ($-a)
.code
mov ax,@data
mov ds,ax
mov cl,n
dec cl
OUTERLOOP:mov ch,cl
          mov si,0
INNERLOOP:mov al,a[si]
        inc si
        cmp al,a[si]
        jb NOXG
        xchg al,a[si]
        mov a[si-1],al
NOXG    :dec ch
         jnz INNERLOOP
         dec cl
         jnz OUTERLOOP
         mov ah,4ch
         int 21h
         END
