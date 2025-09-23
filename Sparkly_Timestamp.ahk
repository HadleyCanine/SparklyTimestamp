; Important! This file needs to be edited to point to the correct path to
; get_timestamp.dll!  Please read the README.txt file for the full
; installation instructions on how to use this script.

>!F5::{
  p_timestamp := DllCall("C:\Path\To\rust_timestamp.dll\get_timestamp", "Ptr")
  timestamp := StrGet(p_timestamp, "UTF-8")

  Send timestamp

  DllCall("C:\Path\To\rust_timestamp.dll\free_timestamp", "Ptr", p_timestamp)

}

