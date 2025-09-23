*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
*~*~*                                                     *~*~*
*~*~*     Welcome to the Sparkly Timestamp Friend! :3     *~*~*
*~*~*                                                     *~*~*
*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*

                          ฅ(^•ﻌ•^ฅ)
   A magnificent magical tool forged in the fires of RUST
      and enchanted with the arcane arts of AutoHotkey!


===================================================================
~*~*~ What's This Sparkly Thing? ~*~*~
===================================================================

This is a little package of magic that lets you instantly type a
perfectly formatted, timezone-aware timestamp with a simple
hotkey! It's super handy for notes, logs, or just knowing
what time it was when you had a super brilliant thought!

Its output looks like this:
2025-09-23 14:10:14 (-0500)

It uses a tiny, super-fast Rust program (.dll) to do the
hard work, and a simple AutoHotkey script (.ahk) to make it
easy to use.


===================================================================
~*~*~ YOUR GRAND QUEST BEGINS! (Installation) ~*~*~
===================================================================

First things first! This quest requires two magical artifacts:

  1. rust_timestamp.dll  (The Engine of Time!)
  2. Sparkly_Timestamp.ahk (The Summoning Scroll!)

>> IMPORTANT <<
   Keep both of these files together in the SAME FOLDER!
   Put them somewhere safe, like "My Documents", not on
   your Desktop where a dragon (or you, by accident)
   might gobble them up!

-------------------------------------------------------------------
   STEP 2: CHOOSE YOUR PATH, BRAVE ADVENTURER!
-------------------------------------------------------------------

You have two quests to choose from! Pick the one that suits
your skills and needs!


---[ PATH 1: The Swift Courier's Quest (Easy Mode!) ]------------

   Choose this path if:
   * You don't already use AutoHotkey for other things.
   * You just want to get your timestamp and go!
   * You want the quickest, simplest setup possible!

   Your Mission:
   1. Press the Windows Key and R at the same time to open the
      ancient "Run" dialog box.

   2. In the box, type this magic spell:
      shell:startup
      ...and press Enter! A folder window will open. This is a
      secret folder where everything launches when Windows starts!

   3. Go back to where you saved your .dll and .ahk files.
      RIGHT-CLICK on "Sparkly_Timestamp.ahk" and choose
      "Create shortcut".

   4. Drag that NEW SHORTCUT into the startup folder you just
      opened.

   5. That's it! You're done! Hooray! Restart your computer,
      and the timestamp magic will be ready and waiting for you!

      *~*~ (ɔ ˘ ³(˘⌣˘c) SUCCESS! *~*~*


---[ PATH 2: The Seasoned Tinkerer's Quest (Adventurer Mode!) ]---

   Choose this path if:
   * You are already an AutoHotkey wizard with your own big,
     fancy script!
   * You want to add this new power to your existing grimoire!

   Your Mission:
   1. Open our "Sparkly_Timestamp.ahk" file in a text editor.
   2. Open YOUR own AutoHotkey script in another text editor.

   3. In our file, copy the block of code below. This is the
      sacred incantation!
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      >!F5::{
        p_timestamp := DllCall("C:\PATH\TO\YOUR\rust_timestamp.dll\get_timestamp", "Ptr")
        timestamp := StrGet(p_timestamp, "UTF-8")
        Send timestamp
        DllCall("C:\PATH\TO\YOUR\rust_timestamp.dll\free_timestamp", "Ptr", p_timestamp)
      }
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   4. IMPORTANT! You MUST change "C:\PATH\TO\YOUR\" to the
      actual, full path where you saved your "rust_timestamp.dll"!

   5. Paste this whole block at the very end of YOUR script.

   6. Save your script and reload it!

      *~*~ (۶•̀ᴗ•́)۶ YOU ARE A MASTER SORCERER! *~*~*


===================================================================
~*~*~ HOW TO MAKE THE MAGIC HAPPEN! (Usage) ~*~*~
===================================================================

Once everything is installed and running, just press:

             RIGHT ALT + F5

And the magic will happen! It will instantly type out a beautiful
timestamp, just like this:

             2025-09-23 13:20:45 (-0500)


===================================================================
*~*~*                                                     *~*~*
*~*~*       Forged with love, glitter, and many           *~*~*
*~*~*       victorious compiler battles by:               *~*~*
*~*~*                                                     *~*~*
*~*~*          Master Architect: Hadley-sama              *~*~*
*~*~*        Familiar & Scribe: Sparkle Mew               *~*~*
*~*~*                                                     *~*~*
*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
