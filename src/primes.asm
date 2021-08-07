WRITE "primes.bin"
        org     &8000
        call    Main
        ld      e,0
        ld      (result),de
        ret

read    "BCxDE.asm"       ; 16b multiply routine

MAX_P   equ     1000      ; highest prime limit
excArr  rmem    MAX_P     ; array for the sieve
result  equ     &9800     ; result for BASIC

Main:
        ld      bc,1      ; currNum
        ld      d,0       ; primeCount

; for (currNum; currNum <= MAX_P; currNum++)
mLoop:
        inc     bc        
        ld      hl,MAX_P           
        sbc     hl,bc      
        ret     c                    
        call    chkExc    ; if(!excluded[currNum])
        cp      1
        jr      nc,mLoop
        push    bc
        push    de         
        ld      d,b       ; DE = currNum
        ld      e,c       
        call    BCxDE     ; HL = i
        ld      d,b       ; DE = currNum
        ld      e,c        
        ld      b,h       ; BC = i
        ld      c,l       

; for(int i=currNum*currNum; i<=MAX_P; i+=currNum)
excLap:
        push    de        ; test i<=MAX_P
        ld      de,MAX_P  
        sbc     hl,de      
        pop     de        
        jr      nc,endExc 
        call    mrkExc    ; excluded[i] = true
        ld      h,b       ; HL,BC=i+=currNum
        ld      l,c       
        add     hl,de     
        ld      b,h       
        ld      c,l       
        jr      excLap    
endExc:
        pop     de        ; restore primeCount
        pop     bc        ; restore currNum
        inc     d         ; primeCount++
        jr      mLoop     

chkExc:
        ld      hl,excArr
        add     hl,bc
        ld      a,(hl)
        ret

mrkExc:
        ld      hl,excArr
        add     hl,bc
        ld      (hl),1
        ret       