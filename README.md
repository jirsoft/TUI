# TUI
 Simple TUI library for CMM2


<b>SUB TUIinfo(title AS STRING, txt() AS STRING, logo AS INTEGER)</b><br>
Shows more lines of info text (BLIT #1), also LOGO (blitnum)
<br><br>
<b>FUNCTION TUIwaitingON(title AS STRING) AS STRING</b><br>
Start progress, returns coordinates as string "X,Y" (BLIT #2)
<br><br>
<b>SUB TUIwaitingProgress(coord AS STRING, perc AS INTEGER)</b><br>
Draw progress into waiting dialog
<br><br>
<b>SUB TUIwaitingOFF(coord AS STRING)</b><br>
Finish progress (BLIT #2)
<br><br>
<b>FUNCTION TUIchoice(title AS STRING, txt AS STRING) AS INTEGER</b><br>
Select one from up to 10 choices with keys 0-9 (BLIT #3)
<br><br>
<b>SUB TUIwarning(title AS STRING, txt AS STRING)</b><br>
Simple warning, wait for any key (BLIT #4)
<br><br>
<b>FUNCTION TUIquestion(title AS STRING, txt AS STRING) AS INTEGER</b><br>
Question, returns 1 when OK (ENTER) was pressed, 0 else (BLIT #5)
<br><br>
<b>FUNCTION TUIinput(title AS STRING, txt AS STRING, def AS STRING, en AS STRING) AS STRING</b><br>
Input string, returns text<br>
HOME to begin, END to end, CRSR left + right<br>
SHIFT+DEL erase all, BACKSPACE 1 char left, DEL 1 char right, ENTER to finish (BLIT #6) 
<br><br>
<b>FUNCTION TUIselect(title AS STRING, txt AS STRING, s AS INTEGER) AS INTEGER</b><br>
Selection checkbox, can select up to 10 choices with keys 0-9 (BLIT #7)
<br><br>
<b>FUNCTION TUIgetItem(title AS STRING, subtitle AS STRING, txt() AS STRING) AS STRING</b><br>
Shows more lines of text (BLIT #8) and let the user select one
<br><br>
<b>FUNCTION TUIgetParent(s AS STRING) AS STRING</b><br>
helper for file selector
<br><br>
<b>FUNCTION TUIgetSelect(path AS STRING, ext AS STRING) AS STRING</b><br>
once-shot file selector<br>
ext can be also more extensiions separated by coma (ext = ".BAS,.INC") or "" (select all)
<br><br>
<b>FUNCTION TUIfileSelect(path AS STRING, ext AS STRING, root AS STRING) AS STRING</b><br>
(almost) complete file selector<br>
ext can be also more extensiions separated by coma (ext = ".BAS,.INC") or "" (select all)<br>
when root<>"", then it's used as highest possible level for going UP and for ROOT
<br><br>
<b>FUNCTION TUIemptyON(title AS STRING, ww AS INTEGER, hh AS INTEGER, but AS STRING) AS STRING</b><br>
Shows empty dialog (space), returns coordinates as string "X,Y" (BLIT #9)<br>
if but is used, then is show instead of "OK"
<br><br>
<b>SUB TUIemptyOFF(coord AS STRING)</b><br>
Close empty (BLIT #9)
<br><br>
<b>SUB TUIwaitForKey</b><br>
<b>SUB TUIwaitForNoKey</b><br>
waits for key or until no key pressed
<br><br>
  
  
#### v0.46
	added optional root parameter to TUIfileSelect

#### v0.45
	TUIchoice now returns 0-x, -13 (ENTER) or -27 (ESC), used for Napoleon Commander
	small bugfix

#### v0.43
	added missing AtariST.FNT
	improved description

#### v0.30
	TUIinput massive improvements (cursor)
	TUIemptyON/OFF added
