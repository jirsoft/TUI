# TUI
 Simple TUI library for CMM2


SUB TUIinfo(title AS STRING, txt() AS STRING, logo AS INTEGER)<br>
Shows more lines of info text (BLIT #1), also LOGO (blitnum)
<hr>
FUNCTION TUIwaitingON(title AS STRING) AS STRING<br>
Start progress, returns coordinates as string "X,Y" (BLIT #2)
<hr>
SUB TUIwaitingProgress(coord AS STRING, perc AS INTEGER)<br>
Draw progress into waiting dialog
<hr>
SUB TUIwaitingOFF(coord AS STRING)<br>
Finish progress (BLIT #2)
<hr>
FUNCTION TUIchoice(title AS STRING, txt AS STRING) AS INTEGER<br>
Select one from up to 10 choices with keys 0-9 (BLIT #3)
<hr>
SUB TUIwarning(title AS STRING, txt AS STRING)<br>
Simple warning, wait for any key (BLIT #4)
<hr>
FUNCTION TUIquestion(title AS STRING, txt AS STRING) AS INTEGER<br>
Question, returns 1 when OK (ENTER) was pressed, 0 else (BLIT #5)
<hr>
FUNCTION TUIinput(title AS STRING, txt AS STRING, def AS STRING, en AS STRING) AS STRING<br>
Input string, returns text<br>
HOME to begin, END to end, CRSR left + right<br>
SHIFT+DEL erase all, BACKSPACE 1 char left, DEL 1 char right, ENTER to finish (BLIT #6) 
<hr>
FUNCTION TUIselect(title AS STRING, txt AS STRING, s AS INTEGER) AS INTEGER<br>
Selection checkbox, can select up to 10 choices with keys 0-9 (BLIT #7)
<hr>
FUNCTION TUIgetItem(title AS STRING, subtitle AS STRING, txt() AS STRING) AS STRING<br>
Shows more lines of text (BLIT #8) and let the user select one
<hr>
FUNCTION TUIgetParent(s AS STRING) AS STRING<br>
helper for file selector
<hr>
FUNCTION TUIgetSelect(path AS STRING, ext AS STRING) AS STRING<br>
once-shot file selector<br>
ext can be also more extensiions separated by coma (ext = ".BAS,.INC") or "" (select all)
<hr>
FUNCTION TUIfileSelect(path AS STRING, ext AS STRING) AS STRING<br>
(almost) complete file selector<br>
ext can be also more extensiions separated by coma (ext = ".BAS,.INC") or "" (select all)
<hr>
FUNCTION TUIemptyON(title AS STRING, ww AS INTEGER, hh AS INTEGER, but AS STRING) AS STRING<br>
Shows empty dialog (space), returns coordinates as string "X,Y" (BLIT #9)<br>
if but is used, then is show instead of "OK"
<hr>
SUB TUIemptyOFF(coord AS STRING)<br>
Close empty (BLIT #9)
<hr>
SUB TUIwaitForKey<br>
SUB TUIwaitForNoKey<br>
waits for key or until no key pressed
<hr>
  
  
#### v0.30
	TUIinput massive improvements (cursor)
	TUIemptyON/OFF added
