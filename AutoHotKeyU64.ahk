#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; # Windows key
; ^ Ctrl
; ! Alt
; + Shift

GroupAdd CN, ahk_exe Explorer.EXE
GroupAdd CN, ahk_exe OUTLOOK.EXE
GroupAdd CN, ahk_class VTWin32 # teraterm
#IfWinNotActive ahk_group CN
{
^N::send,{PgDn}
}

; no remap for teraterm <-- because of wrong behavior.
#IfWinNotActive ahk_class VTWin32
{
; remap doesn't work, so using "send".
;^H::Backspace
^H::send,{Backspace}
^D::send,{Delete}
^M::send,{Enter}
^[::send,{Esc}
;
^J::send,{Left}
^K::send,{Down}
^I::send,{Up}
^L::send,{Right}
;
^P::send,{PgUp}
^B::send,{Home}
^E::send,{End}
;
+^J::send,+{Left}
+^K::send,+{Down}
+^I::send,+{Up}
+^L::send,+{Right}
;
#^J::send,#{Left}
#^K::send,#{Down}
#^I::send,#{Up}
#^L::send,#{Right}
}


; Hot String
; shortcut for date
::,dt::
    FormatTime, now,, yyyy/MM/dd ddd
    Clipboard = %now%
    Send,^v
return

; colemak
is_qwerty := False

toggle_mode() {
    global is_qwerty

	is_qwerty := NOT is_qwerty
    if (is_qwerty) {
        MsgBox qwerty
    } else {
        MsgBox colemak
    }
}

^1::
    toggle_mode()
return

#If NOT is_qwerty
{
    ; use send for remap <-- keep shortcut key
    e::send,f
    r::send,p
    t::send,g
    ;
    y::send,j
    u::send,l
    i::send,u
    o::send,y
    p::send,`;
    ;
    s::send,r
    d::send,s
    f::send,t
    g::send,d
    ;
    j::send,n
    k::send,e
    l::send,i
    `;::send,o
    ;
    n::send,k
    ;
    +e::send,F
    +r::send,P
    +t::send,G
    ;
    +y::send,J
    +u::send,L
    +i::send,U
    +o::send,Y
    +p::send,`:
    ;
    +s::send,R
    +d::send,S
    +f::send,T
    +g::send,D
    ;
    +j::send,N
    +k::send,E
    +l::send,I
    +`;::send,O
    ;
    +n::send,K
}
