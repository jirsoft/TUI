# TUI
 Simple TUI library for CMM2


SUB TUIinfo(title AS STRING, txt() AS STRING, logo AS INTEGER)

Shows more lines of info text (BLIT #1), also LOGO (blitnum)

FUNCTION TUIwaitingON(title AS STRING) AS STRING

Start progress, returns coordinates as string "X,Y" (BLIT #2)

SUB TUIwaitingProgress(coord AS STRING, perc AS INTEGER)

Draw progress into waiting dialog

SUB TUIwaitingOFF(coord AS STRING)

Finish progress (BLIT #2)

FUNCTION TUIchoice(title AS STRING, txt AS STRING) AS INTEGER

Select one from up to 10 choices with keys 0-9 (BLIT #3)

SUB TUIwarning(title AS STRING, txt AS STRING)

Simple warning, wait for any key (BLIT #4)

FUNCTION TUIquestion(title AS STRING, txt AS STRING) AS INTEGER

Question, returns 1 when OK (ENTER) was pressed, 0 else (BLIT #5)

FUNCTION TUIinput(title AS STRING, txt AS STRING, def AS STRING, en AS STRING) AS STRING

Input string, returns text

HOME to begin, END to end, CRSR left + right

SHIFT+DEL erase all, BACKSPACE 1 char left, DEL 1 char right, ENTER to finish (BLIT #6) 

FUNCTION TUIselect(title AS STRING, txt AS STRING, s AS INTEGER) AS INTEGER

Selection checkbox, can select up to 10 choices with keys 0-9 (BLIT #7)


FUNCTION TUIgetItem(title AS STRING, subtitle AS STRING, txt() AS STRING) AS STRING

Shows more lines of text (BLIT #8) and let the user select one


FUNCTION TUIgetParent(s AS STRING) AS STRING

helper for file selector


FUNCTION TUIgetSelect(path AS STRING, ext AS STRING) AS STRING

once-shot file selector

ext can be also more extensiions separated by coma (ext = ".BAS,.INC") or "" (select all)


FUNCTION TUIfileSelect(path AS STRING, ext AS STRING) AS STRING

(almost) complete file selector

ext can be also more extensiions separated by coma (ext = ".BAS,.INC") or "" (select all)



FUNCTION TUIemptyON(title AS STRING, ww AS INTEGER, hh AS INTEGER, but AS STRING) AS STRING

Shows empty dialog (space), returns coordinates as string "X,Y" (BLIT #9)

if but is used, then is show instead of "OK"



SUB TUIemptyOFF(coord AS STRING)

Close empty (BLIT #9)



SUB TUIwaitForKey

SUB TUIwaitForNoKey

waits for key or until no key pressed
  
  
#### v0.30
	TUIinput massive improvements (cursor)
	TUIemptyON/OFF added
