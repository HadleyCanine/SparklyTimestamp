; *~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
; *~*~*  WELCOME TO THE SPARKLY TIMESTAMP SUMMONING SCROLL! :3  *~*~*
; *~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*

; !!! ATTENTION, BRAVE ADVENTURER! YOU MUST EDIT THIS FILE! !!!
;
; This script needs to know the secret location of its magical engine,
; the "rust_timestamp.dll" file. Please read the README.txt file for
; a super-friendly quest guide on how to set this up perfectly!

global sparklyTimestamp := "C:\Users\hadley\Documents\dev\rust_timestamp\rust_timestamp\target\release\rust_timestamp.dll"

; global sparklyTimestamp := "C:\Path\To\rust_timestamp.dll"

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


; -----------------------------------

;; UNIT CONVERSION

; Keep a record of typed keys so we can read what to convert
global inputBuffer := ""
global bufferSize := 64

ih := InputHook("V") ; V for visible (typed text goes where it was supposed to)
ih.OnChar := OnCharHandler
ih.Start()

OnCharHandler(ih, char) {
    global inputBuffer, bufferSize

    inputBuffer .= char

    if StrLen(inputBuffer) > bufferSize
        inputBuffer := SubStr(inputBuffer, StrLen(inputBuffer) - bufferSize + 1)
}

; Bind backspace so we can handle that if someone makes a typo in the measurement
$Backspace:: {
    global inputBuffer

    ; actually delete first of all
    Send("{Backspace}")

    if StrLen(inputBuffer) > 0 {
        inputBuffer := SubStr(inputBuffer, 1, -1)
    }

    return ; prevent further processing
}

>!F9::{
    global inputBuffer, sparklyTimestamp

    p_converted := DllCall(sparklyTimestamp . "\get_unit_conversion", "AStr", inputBuffer, "Ptr")

    ; only proceed if a valid pointer
    if (!p_converted) {
        MsgBox("SparklyTimestamp's unit conversion failed!")
        return
    }

    converted := StrGet(p_converted, "UTF-8")
    Send converted

    DllCall(sparklyTimestamp . "\free_unit_conversion", "Ptr", p_converted)
}



