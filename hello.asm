.386
.model flat,stdcall 
includelib \masm32\lib\kernel32.lib
extern ExitProcess@4:near
extern GetStdHandle@4:near
extern CloseHandle@4:near
extern lstrlenA@4:near
extern WriteConsoleA@20:near
extern ReadConsoleA@20:near

_DATA SEGMENT

han_in  dd 0
han_out dd 0
szMes   db "I hate you,and you hate me >",0
leng    dd 0
count   dd 0
arrBuf  db 255 dup(0) 

_DATA ENDS
;-------------------------
_TEXT SEGMENT
START:

;-----------
push -0Ah
call GetStdHandle@4
mov han_in,eax
push -0Bh
call GetStdHandle@4
mov han_out,eax
;-----------

;-----------
push offset szMes
call lstrlenA@4
mov leng,eax
;-----------

;-----------
push 0
push offset count
push leng
push offset szMes
push han_out
call WriteConsoleA@20
;-----------

;-----------
push 0
push offset count
push 255
push offset arrBuf
push han_in
call ReadConsoleA@20
;-----------

;-----------
push han_in
call CloseHandle@4
push han_out
call CloseHandle@4
;-----------

push 0
call ExitProcess@4
_TEXT ENDS
END START
