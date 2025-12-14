*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
*~*~*                                                       *~*~*
*~*~*     Welcome to the Sparkly Timestamp Friend! :3       *~*~*
*~*~*                                                       *~*~*
*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*

                          ฅ(^•ﻌ•^ฅ)
   A magnificent magical tool forged in the fires of RUST
      and enchanted with the arcane arts of AutoHotkey!


======================================
~*~*~ What's This Sparkly Thing? ~*~*~
======================================

This is a little package of magic that helps you type two kinds
of sparkly helpers quickly:

- A timezone-aware timestamp (hotkey: Right Alt / AltGr + F5)
- A tiny unit autoconversion that appends a converted value
   (hotkey: Right Alt / AltGr + F9)

(Unit conversion requires the unit-aware calculator fend to be
installed, for which instructions to install are included below)

Both helpers use a tiny, super-fast Rust engine (`rust_timestamp.dll`)
to do the work and an AutoHotkey script (`Sparkly_Timestamp.ahk`) to
connect the magic to your keyboard.

Timestamp example (what the timestamp looks like when you summon it):
2025-09-23 14:10:14 (-0500)

Unit conversion example — what the autoconversion looks like in practice:
If you type: 25cm
Then press: Right Alt (AltGr) + F9
It will append something like:  (approx. 9.8425 inches)
(The conversion is performed to 4 decimal places.)


===================================================
~*~*~ YOUR GRAND QUEST BEGINS! (Installation) ~*~*~
===================================================

Your quest is simple: you must teach the Summoning Scroll (.ahk)
the secret location of its magical Engine (.dll)!


---[ OPTIONAL: Install the `fend` tool ]-----------------------

(NOTE: This is only needed if you want to use unit conversion.
If you only need timestamps, you can skip this step!)

The unit autoconversion feature uses the external tool `fend` to
perform numeric and unit conversions. If you want this feature,
install `fend` on your Windows system using one of the methods below.

Official docs and downloads are at:
https://printfn.github.io/fend/documentation/

Recommendation for most users: use the standard Windows installer
(MSI) available from the project's documentation page — it's the
simplest, most straightforward installer for Windows users.

If you prefer package managers, optional commands (for advanced
users) are:

winget install fend
choco install fend


---[ STEP 1: Find a Home for Your Magic! ]------------------------

First, let's create a safe, permanent home for your new magic!

1. Open File Explorer.

2. Click in the address bar at the top, delete whatever is there,
   and copy/paste over this magic spell, then press Enter:

   %USERPROFILE%\Documents

3. This will teleport you to your main Documents folder! Here,
   create a NEW FOLDER. We suggest naming it `SparklyTimestamp`.

4. Move all the files from this package (`README.txt`,
   `rust_timestamp.dll`, and `Sparkly_Timestamp.ahk`) into
   the new `SparklyTimestamp` folder you just made!


---[ STEP 2: The Path-Finding Spell (The Most Important Step!) ]--

Now that your files have a proper home, we can do our trick!

1. You should already be inside your new `SparklyTimestamp` folder.

2. Click once on the address bar at the top of the window. The
   path should turn blue, highlighting the whole thing.
   *~*~ If it's not all selected, press CTRL+A to select it all! *~*~*

3. Press CTRL + C to copy this folder path to your clipboard.

4. Now, find the "Sparkly_Timestamp.ahk" file, RIGHT-CLICK on it,
   and choose "Edit Script". This will open it in Notepad.
   (Advanced users: ...or your text editor of choice!)

5. !!! A QUICK NOTE FOR NOTEPAD USERS !!!
   Before editing, please look at the "Format" menu at the top
   of Notepad. If "Word Wrap" has a checkmark next to it,
   CLICK IT TO TURN IT OFF. This will make the long lines of
   code much easier to read and edit correctly!

6. Inside the script you'll find a single global variable near the top that points
   to the DLL. Edit only that one line instead of hunting for DllCall calls:

   Example (replace with your real path):

   global sparklyTimestamp := "C:\Users\YourName\Documents\SparklyTimestamp\rust_timestamp.dll"

7. Save and close the script file. That's it — the AHK hotkeys use that variable
   to call the DLL, so you only need to edit one line.


---[ STEP 3: Awaken the Magic! ]---------------------------------

You're ready to test your work! To awaken the magic manually,
simply find your edited "Sparkly_Timestamp.ahk" script and
double-click it! The hotkey is now active and you can try it!

Press RIGHT ALT + F5 to see your timestamp appear!

Or type out a measurement (such as "25 inches" or "100C")
and hit RIGHT ALT + F9 to autocomplete with a conversion
to imperial/metric!


---[ STEP 4: Make the Magic Automatic! (Recommended!) ]-----------

Want the magic to be ready every time you start your computer?
This final step will make it so!

1. Press WIN+R to open the "Run" dialog.
2. Type `shell:startup` and hit Enter. A special folder will open.
3. Find your "Sparkly_Timestamp.ahk" script file again.
4. RIGHT-CLICK on it and choose "Create shortcut".
5. Drag that NEW SHORTCUT into the startup folder you just opened.

   Congratulations! Your quest is complete! Hooray!

        /\_/\
       ( o.o )
        > ^ <


---[ *~* SECRET KNOWLEDGE FOR WIZARDS! *~* ]----------------------

 *  For AutoHotkey Veterans: No need to run another script! Just
    copy the code block from our `.ahk` (after editing the DLL
    path inside it!) and paste it into your own master script.

 *  For the Code Alchemists: This package includes the full Rust
    source code for `rust_timestamp.dll`! If you're feeling
    adventurous and want a different timestamp format, you can
    get your paws dirty by editing the `src\lib.rs` file. Just
    change the format string inside the `local.format()` command,
    then use `cargo build --release` to re-forge the .dll!

===================================================================