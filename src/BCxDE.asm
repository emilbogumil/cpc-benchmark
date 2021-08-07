; ====================================================
; Multiply two 16-bit numbers
; ----------------------------------------------------
; Inputs        BC, DE
; Outputs       DE - higher 16b, HL - lower 16b
; Modified      A, DE, HL, c
; Cycles        367 - 383 
; ====================================================


BCxDE:
        ld      a,16      ; set loop counter      2c 
        ld      hl,0      ; reset lower output    2c

m16Lap:
        add     hl,hl     ; lshift low output     3c
        rl      e         ; lrotate multiplier    2c
        rl      d         ;                       2c
        jr      nc,m16End ; bit7=0 -> end loop  3/7c
        add     hl,bc     ; else add multiplier   3c
        jr      nc,m16End ; hl>FF -> 
        inc     de        ; inc high output       1c

m16End:
        dec     a         ; dec loop counter      1c
        cp      0         ; counter!=0 ->         2c
        jr      nz,m16Lap ; repeat loop         3/7c

        ret 