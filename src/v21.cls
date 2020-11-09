VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "v21"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Implements IRjlWinAmpGenPlugin
Private m_Wrapper As IRjlWinAmpGenWrapper
Private Sub IRjlWinAmpGenPlugin_Initialize(ByVal Wrapper As RjlWinAmpGenLib.IRjlWinAmpGenWrapper)
Set m_Wrapper = Wrapper
Set Varz.myWrapper = Wrapper
m_Wrapper.Description = "shutAMP v2.1 (gen_shutAMP.v21.dll, shutAMP.dll)"
Varz.DimVarz
End Sub
Private Sub IRjlWinAmpGenPlugin_Configure()
Config.Show 1
End Sub
Private Sub IRjlWinAmpGenPlugin_Quit()
End Sub
