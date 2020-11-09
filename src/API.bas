Attribute VB_Name = "API"
Private Type LUID
    UsedPart As Long
    IgnoredForNowHigh32BitPart As Long
End Type
Private Type TOKEN_PRIVILEGES
    PrivilegeCount As Long
    TheLuid As LUID
    Attributes As Long
End Type
Declare Function ExitWindowsEx Lib "user32" (ByVal dwOptions As Long, ByVal dwReserved As Long) As Long
Declare Function GetCurrentProcess Lib "kernel32" () As Long
Declare Function OpenProcessToken Lib "advapi32" (ByVal ProcessHandle As Long, ByVal DesiredAccess As Long, TokenHandle As Long) As Long
Declare Function LookupPrivilegeValue Lib "advapi32" Alias "LookupPrivilegeValueA" (ByVal lpSystemName As String, ByVal lpName As String, lpLuid As LUID) As Long
Declare Function AdjustTokenPrivileges Lib "advapi32" (ByVal TokenHandle As Long, ByVal DisableAllPrivileges As Long, NewState As TOKEN_PRIVILEGES, ByVal BufferLength As Long, PreviousState As TOKEN_PRIVILEGES, ReturnLength As Long) As Long
Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Declare Function ReleaseCapture Lib "user32" () As Long
Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Dim Trigger As Long
Private Sub AdjustToken()
    Const TOKEN_ADJUST_PRIVILEGES = &H20
    Const TOKEN_QUERY = &H8
    Const SE_PRIVILEGE_ENABLED = &H2
    Dim hdlProcessHandle As Long
    Dim hdlTokenHandle As Long
    Dim tmpLuid As LUID
    Dim tkp As TOKEN_PRIVILEGES
    Dim tkpNewButIgnored As TOKEN_PRIVILEGES
    Dim lBufferNeeded As Long
    hdlProcessHandle = GetCurrentProcess()
    OpenProcessToken hdlProcessHandle, (TOKEN_ADJUST_PRIVILEGES Or TOKEN_QUERY), hdlTokenHandle
    LookupPrivilegeValue "", "SeShutdownPrivilege", tmpLuid
    tkp.PrivilegeCount = 1
    tkp.TheLuid = tmpLuid
    tkp.Attributes = SE_PRIVILEGE_ENABLED
    AdjustTokenPrivileges hdlTokenHandle, False, tkp, Len(tkpNewButIgnored), tkpNewButIgnored, lBufferNeeded
End Sub
Sub Monitor()
    Dim Condition, Length, Current
    Condition = SendMessage(Varz.myWrapper.HwndParent, &H400, 0, 104)
    If Condition = 1 Or Condition = 3 Then
    Else
        Length = SendMessage(Varz.myWrapper.HwndParent, &H400, 0, 124)
        Current = SendMessage(Varz.myWrapper.HwndParent, &H400, 0, 125)
        If CInt(Current) = CInt(Length) - 1 Then
            Commence
        End If
    End If
End Sub
Sub Commence()
    Trigger = KillTimer(Config.hwnd, 1)
    DialogShut.Show 1
End Sub
Public Function Cancel()
    Trigger = KillTimer(DialogShut.hwnd, 1)
    Config.EnableCheck.Enabled = False
    Config.EnableCheck.Value = 0
    Config.EnableCheck.Caption = "Disabled"
    Config.ArmCheck.Value = 0
    Varz.ArmFlag = False
    Varz.EnableFlag = False
    DialogShut.Hide
    Unload DialogShut
End Function
Public Function Shutdown()
    Cancel
    AdjustToken
    ExitWindowsEx (9), &HFFFF
End Function

