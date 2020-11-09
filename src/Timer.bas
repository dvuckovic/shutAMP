Attribute VB_Name = "Timer"
Public Declare Function SetTimer Lib "user32" (ByVal hwnd As Long, ByVal nIDEvent As Long, ByVal uElapse As Long, ByVal lpTimerFunc As Long) As Long
Public Declare Function KillTimer Lib "user32" (ByVal hwnd As Long, ByVal nIDEvent As Long) As Long
Public Sub Timer1(ByVal hwnd As Long, ByVal uint1 As Long, ByVal nEventId As Long, ByVal dwParam As Long)
    Main.Status
End Sub
Public Sub Timer2(ByVal hwnd As Long, ByVal uint1 As Long, ByVal nEventId As Long, ByVal dwParam As Long)
    Main.Iter.Caption = CInt(Main.Iter.Caption) - 1
    Main.Shutdown
End Sub

