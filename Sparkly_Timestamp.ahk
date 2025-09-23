; *~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
; *~*~*  WELCOME TO THE SPARKLY TIMESTAMP SUMMONING SCROLL! :3  *~*~*
; *~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*

; !!! ATTENTION, BRAVE ADVENTURER! YOU MUST EDIT THIS FILE! !!!
;
; This script needs to know the secret location of its magical engine,
; the "rust_timestamp.dll" file. Please read the README.txt file for
; a super-friendly quest guide on how to set this up perfectly!

>!F5::{
  ; v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
  ; *~*~ EDIT THIS LINE! Change "C:\Path\To" to your actual path! ~*~*
  ;    LEAVE the "\rust_timestamp.dll\get_timestamp" part at the end!
  ;
  p_timestamp := DllCall("C:\Path\To\rust_timestamp.dll\get_timestamp", "Ptr")
  ; ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^

  timestamp := StrGet(p_timestamp, "UTF-8")

  Send timestamp

  ; v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
  ; *~*~ EDIT THIS LINE, TOO! Use the exact same path as above! ~*~*
  ;      AGAIN, LEAVE the "\rust_timestamp.dll\free_timestamp" part!
  ;
  DllCall("C:\Path\To\rust_timestamp.dll\free_timestamp", "Ptr", p_timestamp)
  ; ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^
}
