OPTION DEFAULT NONE
OPTION EXPLICIT
OPTION BASE 0

CHDIR MM.INFO$(PATH)
#INCLUDE "TUI.INC"

CLS RGB(NOTBLACK)
LOAD FONT "AtariST.FNT"


DIM INTEGER i, m, r, c
DIM STRING menu(4), sel
menu(0) ="FORE COLOR,Gray,Black,Green,Red"
menu(1) ="BACKGROUND,Yellow,White,Blue"
menu(2) ="INPUT,Cyan,Magenta"
menu(3) ="FONT,Font 8 (8x16),Font 1 (8x12),Font 4 (10x16),Font 7 (6x8)"
menu(4) ="EXIT menu test"
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

IF FONT.TUI <> 8 THEN TICK.TUI = "x"

ON KEY 157, printScreen
DO 
  i = TUIchoice("TUI CHOICE","MENU test,WARNING,INFO,WAITING,QUESTION,SELECT,GET ITEM,FILE SELECT,INPUT")
  SELECT CASE i
    CASE 0
      DO
      m = TUImenu(menu())
      IF m>=0 THEN
        c = m \ 100: r = m MOD 100
        SELECT CASE c
          CASE 0
            IF r=0 THEN
              SELECT CASE FC.TUI
                CASE RGB(GRAY)
                  sel = "FOREGROUND is gray"

                CASE RGB(BLACK)
                  sel = "FOREGROUND is black"

                CASE RGB(GREEN)
                  sel = "FOREGROUND is green"

                CASE RGB(RED)
                  sel = "FOREGROUND is red"

                CASE ELSE
                  sel = "FOREGROUND has strange color"

              END SELECT
              TUIwarning("TUI MENU", sel)

            ELSEIF r=1 THEN
              FC.TUI = RGB(GRAY)

            ELSEIF r=2 THEN
              FC.TUI = RGB(BLACK)

            ELSEIF r=3 THEN
              FC.TUI = RGB(GREEN)

            ELSEIF r=4 THEN
              FC.TUI = RGB(RED)
            ENDIF

          CASE 1
            IF r=0 THEN
              SELECT CASE BC.TUI
                CASE RGB(YELLOW)
                  sel = "BACKGROUND is yellow"

                CASE RGB(WHITE)
                  sel = "BACKGROUND is white"

                CASE RGB(BLUE)
                  sel = "FOREGROUND is blue"

                CASE ELSE
                  sel = "BACKGROUND has strange color"

              END SELECT
              TUIwarning("TUI MENU", sel)

            ELSEIF r=1 THEN
              BC.TUI = RGB(YELLOW)

            ELSEIF r=2 THEN
              BC.TUI = RGB(WHITE)

            ELSEIF r=3 THEN
              BC.TUI = RGB(BLUE)

            ENDIF

          CASE 2
            IF r=0 THEN
              SELECT CASE IC.TUI
                CASE RGB(CYAN)
                  sel = "INPUT is cyan"

                CASE RGB(MAGENTA)
                  sel = "INPUT is magenta"

                CASE ELSE
                  sel = "INPUT has strange color"

              END SELECT
              TUIwarning("TUI MENU", sel)

            ELSEIF r=1 THEN
              IC.TUI = RGB(CYAN)

            ELSEIF r=2 THEN
              IC.TUI = RGB(MAGENTA)

            ENDIF

          CASE 3
            IF r=0 THEN
              SELECT CASE FONT.TUI
                CASE 8
                  sel = "FONT is 8, 8x16"

                CASE 1
                  sel = "FONT is 1, 8x12"

                CASE 4
                  sel = "FONT is 4, 10x16"

                CASE 7
                  sel = "FONT is 7, 6x8"

                CASE ELSE
                  sel = "FONT is strange (" + STR$(FONT.TUI) + ")"

              END SELECT
              TUIwarning("TUI MENU", sel)

            ELSEIF r=1 THEN
              FONT.TUI = 8

            ELSEIF r=2 THEN
              FONT.TUI = 1

            ELSEIF r=3 THEN
              FONT.TUI = 4

            ELSEIF r=4 THEN
              FONT.TUI = 7

            ENDIF
            IF FONT.TUI=8 THEN 
              TICK.TUI = CHR$(232)
            ELSE
              TICK.TUI = "x"
            ENDIF

          CASE 4
            m=-999
        END SELECT

      ELSE
        TUIwarning("TUI MENU", "Cancel (ESC pressed)")
      ENDIF
      TUIwaitForNoKey
      TUIwaitForNoKey
      TUIwaitForNoKey
      LOOP WHILE m<>-999

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
      path = MM.INFO$(DIRECTORY)
      ext = ""
      dialog = TUIfileSelect(path, ext)
      TUIwarning("TUI FILE SELECT", "Chosen '" + path + dialog + "'")
    
    CASE 8
      dialog = TUIinput("TUI INPUT","Enter number:","13", "0123456789")
      TUIwarning("TUI INPUT", "Entered '" + dialog + "'")            
      TUIwaitForNoKey
      TUIwaitForNoKey
      dialog = TUIinput("TUI INPUT","Enter lower case chars:","", "abcdefghijklmnopqrstuvwxyz")
      TUIwarning("TUI INPUT", "Entered '" + dialog + "'")
  END SELECT
LOOP WHILE i<>-27
END

SUB printScreen
  IF ON.TUI THEN
    SAVE IMAGE "/SS.BMP", X.TUI, Y.TUI, W.TUI, H.TUI
  ENDIF
END SUB

