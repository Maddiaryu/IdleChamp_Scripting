#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode, 2
wintitle := "Idle Champions"
sleepL := 10000
sleepU := 10000
ActiveSeats := []
ActiveUlts := []
runningL := 0
runningU := 0
maxU := 0
maxL := 0
Gui, Destroy
Sleep, 1000

Gui, New,,Idle Dragons Helper
Gui, Add, Checkbox, x12 y9 w60 h20 vFun1, Seat 1
Gui, Add, Checkbox, x12 y29 w60 h20 vFun2, Seat 2
Gui, Add, Checkbox, x12 y49 w60 h20 vFun3, Seat 3
Gui, Add, Checkbox, x12 y69 w60 h20 vFun4, Seat 4
Gui, Add, Checkbox, x12 y89 w60 h20 vFun5, Seat 5
Gui, Add, Checkbox, x12 y109 w60 h20 vFun6, Seat 6
Gui, Add, Checkbox, x12 y129 w60 h20 vFun7, Seat 7
Gui, Add, Checkbox, x12 y149 w60 h20 vFun8, Seat 8
Gui, Add, Checkbox, x12 y169 w60 h20 vFun9, Seat 9
Gui, Add, Checkbox, x12 y189 w60 h20 vFun10, Seat 10
Gui, Add, Checkbox, x12 y209 w60 h20 vFun11, Seat 11
Gui, Add, Checkbox, x12 y229 w60 h20 vFun12, Seat 12 
Gui, Add, Checkbox, x92 y9 w80 h20 vUlt1, Ultimate 1
Gui, Add, Checkbox, x92 y29 w80 h20 vUlt2, Ultimate 2
Gui, Add, Checkbox, x92 y49 w80 h20 vUlt3, Ultimate 3
Gui, Add, Checkbox, x92 y69 w80 h20 vUlt4, Ultimate 4
Gui, Add, Checkbox, x92 y89 w80 h20 vUlt5, Ultimate 5
Gui, Add, Checkbox, x92 y109 w80 h20 vUlt6, Ultimate 6
Gui, Add, Checkbox, x92 y129 w80 h20 vUlt7, Ultimate 7
Gui, Add, Checkbox, x92 y149 w80 h20 vUlt8, Ultimate 8
Gui, Add, Checkbox, x92 y169 w80 h20 vUlt9, Ultimate 9
Gui, Add, Checkbox, x92 y189 w80 h20 vUlt0, Ultimate 0
Gui, Add, Checkbox, x92 y229 w80 h20 vRight, Press Right
Gui, Add, Edit, x352 y9 w110 h20 Limit6 -vscroll, Edit
Gui, Add, UpDown, x179 y84 w18 h30 vLvlUpDelay Range1-10000, 1000
Gui, Add, Edit, x352 y39 w110 h20 Limit6 -vscroll, Edit
Gui, Add, UpDown, x179 y214 w18 h30 vUltDelay Range1-60000, 20000
Gui, Add, Text, x192 y9 w150 h20 , Delay Between Level Ups (ms)
Gui, Add, Text, x192 y39 w150 h20 , Delay Between Ultimates (ms)
Gui, Add, Button, x202 y109 w90 h30 gStartL, Start Lvl
Gui, Add, Button, x332 y109 w90 h30 gStartU, Start Ult
Gui, Add, Button, x332 y149 w90 h30 gStopU, Stop Ult
Gui, Add, Button, x202 y149 w90 h30 gStopL, Stop Lvl
Gui, Add, Text, x202 y189 w90 h80 +Center vLvlInfoBox,
Gui, Add, Text, x332 y189 w90 h80 +Center vUltInfoBox,
Gui, Add, Button, x262 y69 w100 h30 gUpdate, Update Selection

Gui, Show, x690 y371 h267 w472
MStart()
Return

Update:
UpdateS()
return

UpdateS()
{
global
Gui, Submit, NoHide
sleepL := LvlUpDelay
sleepU := UltDelay
ActiveSeats := []
ActiveUlts := []
if (Fun1 = 1)
{
    ActiveSeats.Push("F1")
}
if (Fun2 = 1)
{
    ActiveSeats.Push("F2")
}
if (Fun3 = 1)
{
    ActiveSeats.Push("F3")
}
if (Fun4 = 1)
{
    ActiveSeats.Push("F4")
}
if (Fun5 = 1)
{
    ActiveSeats.Push("F5")
}
if (Fun6 = 1)
{
    ActiveSeats.Push("F6")
}
if (Fun7 = 1)
{
    ActiveSeats.Push("F7")
}
if (Fun8 = 1)
{
    ActiveSeats.Push("F8")
}
if (Fun9 = 1)
{
    ActiveSeats.Push("F9")
}
if (Fun10 = 1)
{
    ActiveSeats.Push("F10")
}
if (Fun11 = 1)
{
    ActiveSeats.Push("F11")
}
if (Fun12 = 1)
{
    ActiveSeats.Push("F12")
}
    
if (Ult1 = 1)
    ActiveUlts.Push("1")
if (Ult2 = 1)
    ActiveUlts.Push("2")
if (Ult3 = 1)
    ActiveUlts.Push("3")
if (Ult4 = 1)
    ActiveUlts.Push("4")
if (Ult5 = 1)
    ActiveUlts.Push("5")
if (Ult6 = 1)
    ActiveUlts.Push("6")
if (Ult7 = 1)
    ActiveUlts.Push("7")
if (Ult8 = 1)
    ActiveUlts.Push("8")
if (Ult9 = 1)
    ActiveUlts.Push("9")
if (Ult0 = 1)
    ActiveUlts.Push("0")
    
maxU := 0
for i, e in ActiveUlts
    maxU++

maxL := 0
for i, e in ActiveSeats
    maxL++
return
}

StartL:
UpdateS()
countL := 1
runningL := 1
;MStart()
return

StopL:
runningL := 0
GuiControl, Text, LvlInfoBox, Stopped
return

StartU:
UpdateS()
countU := 1
runningU := 1
;MStart()
return

StopU:
runningU := 0
GuiControl, Text, UltInfoBox, Stopped
return

MStart()
{
global
UpdateS()

    
countU := 1
t1U := A_TickCount + sleepU
countL := 1
t1L := A_TickCount + sleepL
;while ((runningL = 1) OR (runningU = 1))
Loop
{
    if (runningU = 1 AND ((t1U - A_TickCount) < 0))
    {
        element := ActiveUlts[countU]
        if (element != "")
        {
            ControlSend,,{%element%}, %wintitle%
            FormatTime, Out, , HH:mm:ss
            GuiControl, Text, UltInfoBox, %Out% `n Pressed %element%           
        }

        t1U := A_TickCount + sleepU
        if (countU >= maxU)
        {
            countU = 1
        }
        else
        {
            countU++
        }
    }
    
    if (runningL = 1 AND ((t1L - A_TickCount) < 0))
    {
        element := ActiveSeats[countL]
        if (element != "")
        {
            ControlSend,,{%element%}, %wintitle%
            FormatTime, Out, , HH:mm:ss
            GuiControl, Text, LvlInfoBox, %Out% `n Pressed %element%        
        }
        
        t1L := A_TickCount + sleepL
        if (countL >= maxL)
        {
            countL = 1
        }
        else
        {
            countL++
        }
    }
    
    if (Right = 1)
        ControlSend,,{Right}, %wintitle%
    
    Sleep 500
}
return
}
return

+F1::
if (runningL = 1)
{
    Goto, StopL
}
else
{
    Goto, StartL
}
return

+F2::
if (runningU = 1)
{
    Goto, StopU
}
else
{
    Goto, StartU
}
return

GuiClose:
ExitApp