#MMDEBUG ON
OPTION DEFAULT NONE
OPTION EXPLICIT
OPTION BASE 0

#INCLUDE "TUI.INC"

CLS RGB(NOTBLACK)
LOAD FONT "AtariST.FNT"


DIM INTEGER i
DIM STRING dialog, path, ext
DIM STRING txt(99)
FOR i = 0 TO BOUND(txt())
  txt(i) = STR$(i, 2) + " = $" + HEX$(i, 2)
NEXT i
DIM STRING inf(5) = ("   Info can have","   few lines of text","","","Also LOGO can","be in left upper corner.")
DIM STRING SCR.SHOT = ""

PAGE WRITE 1
CLS RGB(NOTBLACK)
TEXT 0,0,CHR$(252)+CHR$(253),"LT",8,,RGB(BLUE),RGB(BLACK)
TEXT 0,16,CHR$(254)+CHR$(255),"LT",8,,RGB(BLUE),RGB(BLACK)
BLIT READ #63, 0,4,16,24,1
PAGE WRITE 0

'FONT.TUI = 3
'FC.TUI = RGB(BLACK)
'BC.TUI = RGB(BLUE)
'IC.TUI = RGB(RED)
IF FONT.TUI <> 8 THEN TICK.TUI = "x"

ON KEY 157, printScreen
DO 
  i = TUIchoice("TUI CHOICE","QUIT tests,WARNING,INFO,WAITING,QUESTION,SELECT,GET ITEM,FILE SELECT,INPUT")
  SELECT CASE i
    CASE 1
      TUIwarning("TUI WARNING", "This is the warning from TUI " + VERSION.TUI)

    CASE 2
      TUIinfo("TUI INFO",inf(),63)

    CASE 3
      dialog = TUIwaitingON("TUI WAITING (key to continue)")
      TUIwaitForKey
      TUIwaitingOFF(dialog)
      dialog = TUIwaitingON("TUI WAITING with progress bar")
      FOR i = 0 TO 100
        TUIwaitingProgress(dialog, i)
        PAUSE 20
      NEXT i
      TUIwaitingOFF(dialog)

    CASE 4
      TUIwarning("TUI QUESTION","Chosen '" + STR$(TUIquestion("QUESTION","How are you?")) + "'")

    CASE 5
      i = TUIselect("TUI SELECT","One,Two,Three,Four,Five")
      i = 1

    CASE 6
      TUIwarning("TUI GET ITEM", "Chosen '" + TUIgetItem("GET ITEM","DEC to HEX",txt()) + "'")

    CASE 7
      path = "A:/"
      ext = ""
      dialog = TUIfileSelect(path, ext)
      TUIwarning("TUI FILE SELECT", "Chosen '" + path + dialog + "'")
    
    CASE 8
      dialog = TUIinput("TUI INPUT","Enter number:","13", "0123456789")
      TUIwarning("TUI INPUT", "Entered '" + dialog + "'")            
      dialog = TUIinput("TUI INPUT","Enter lower case chars:","", "abcdefghijklmnopqrstuvwxyz")
      TUIwarning("TUI INPUT", "Entered '" + dialog + "'")
  END SELECT
LOOP WHILE i>0
END

SUB printScreen
  IF ON.TUI THEN
    SAVE IMAGE "/SS.BMP", X.TUI, Y.TUI, W.TUI, H.TUI
  ENDIF
END SUB

