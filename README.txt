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

This is a little package of magic that lets you instantly type a
perfectly formatted, timezone-aware timestamp with a simple
hotkey! It's super handy for notes, logs, or just knowing
what time it was when you had a super brilliant thought!

Its output looks like this:
2025-09-23 14:10:14 (-0500)

It uses a tiny, super-fast Rust program (`rust_timestamp.dll`)
to do the hard work, and a simple AutoHotkey script
(`Sparkly_Timestamp.ahk`) to make it easy to use.


===================================================
~*~*~ YOUR GRAND QUEST BEGINS! (Installation) ~*~*~
===================================================

Your quest is simple: you must teach the Summoning Scroll (.ahk)
the secret location of its magical Engine (.dll)!

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

6. Inside the script, you will see lines with big, sparkly comments
   telling you to "EDIT THIS LINE!".

7. Delete the `C:\Path\To` part of the line.

8. Press CTRL + V to PASTE your real folder path in its place.

9. !!! SUPER IMPORTANT !!!
   Make ABSOLUTELY SURE that you leave the rest of the line alone!
   The path needs to end with `\rust_timestamp.dll\get_timestamp`
   and `\rust_timestamp.dll\free_timestamp`.

   DO THIS FOR **BOTH** OF THE LINES THAT NEED EDITING!

10. *~*~* YOUR FINAL CHECK! *~*~*
    When you are done, your edited lines should look something
    like this (but with YOUR user name and folder path):
    `DllCall("C:\Users\YourName\Documents\SparklyTimestamp\rust_timestamp.dll\get_timestamp", "Ptr")`

11. Save and close the script file! (You can turn Word Wrap
    back on in Notepad now if you like.) You did it! The scroll
    has now learned the spell!


---[ STEP 3: Awaken the Magic! ]----------------------------------

You're ready to test your work! To awaken the magic manually,
simply find your edited "Sparkly_Timestamp.ahk" script and
double-click it! The hotkey is now active and you can try it!

Press RIGHT ALT + F5 to see your timestamp appear!


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
    copy the code block from our `.ahk` (after editing the paths!)
    and paste it into your own master script.

 *  For the Code Alchemists: This package includes the full Rust
    source code for `rust_timestamp.dll`! If you're feeling
    adventurous and want a different timestamp format, you can
    get your paws dirty by editing the `src\lib.rs` file. Just
    change the format string inside the `local.format()` command,
    then use `cargo build --release` to re-forge the .dll!

===================================================================