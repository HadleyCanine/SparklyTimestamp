; *~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
; *~*~*  WELCOME TO THE SPARKLY TIMESTAMP SUMMONING SCROLL! :3  *~*~*
; *~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*

; !!! ATTENTION, BRAVE ADVENTURER! YOU MUST EDIT THIS FILE! !!!
;
; This script needs to know the secret location of its magical engine,
; the "rust_timestamp.dll" file:

global sparklyTimestamp := "C:\Path\To\rust_timestamp.dll"


;; TIMESTAMP

>!F5::{
  p_timestamp := DllCall(sparklyTimestamp . "\get_timestamp", "Ptr")

  timestamp := StrGet(p_timestamp, "UTF-8")

  Send timestamp

  DllCall(sparklyTimestamp . "\free_timestamp", "Ptr", p_timestamp)
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

    ; workaround for this key getting stuck down on this complex input
    Send("{RAlt Up}")

    p_converted := DllCall(sparklyTimestamp . "\get_unit_conversion", "AStr", inputBuffer, "Ptr")

    ; only proceed if a valid pointer
    if (!p_converted) {
        MsgBox("SparklyTimestamp's unit conversion failed!")
        return
    }

    converted := StrGet(p_converted, "UTF-8")
    Send("{Text}" . converted)

    DllCall(sparklyTimestamp . "\free_unit_conversion", "Ptr", p_converted)
}

