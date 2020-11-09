VERSION 5.00
Begin VB.Form Config 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "shutAMP 2.1"
   ClientHeight    =   1065
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   1320
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1065
   ScaleWidth      =   1320
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Patsy 
      Default         =   -1  'True
      Height          =   255
      Left            =   1560
      TabIndex        =   4
      Top             =   120
      Width           =   255
   End
   Begin VB.Frame Frame 
      Height          =   1140
      Left            =   0
      TabIndex        =   0
      Top             =   -75
      Width           =   1320
      Begin VB.CommandButton HideBut 
         Caption         =   "Hide"
         CausesValidation=   0   'False
         BeginProperty Font 
            Name            =   "Small Fonts"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   270
         Left            =   60
         TabIndex        =   3
         TabStop         =   0   'False
         Top             =   825
         Width           =   1215
      End
      Begin VB.CheckBox ArmCheck 
         Caption         =   "&Arm"
         BeginProperty Font 
            Name            =   "Small Fonts"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   360
         TabIndex        =   2
         TabStop         =   0   'False
         Top             =   540
         Width           =   615
      End
      Begin VB.CheckBox EnableCheck 
         Height          =   375
         Left            =   60
         Style           =   1  'Graphical
         TabIndex        =   1
         TabStop         =   0   'False
         Top             =   150
         Width           =   1215
      End
   End
End
Attribute VB_Name = "Config"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Trigger As Long
Private Sub ArmCheck_Click()
    If Varz.ArmFlag = False Then
        EnableCheck.Enabled = True
        EnableCheck.Caption = "Disabled"
        Varz.ArmFlag = True
    Else
        Trigger = KillTimer(Config.hwnd, 1)
        EnableCheck.Enabled = False
        EnableCheck.Value = 0
        EnableCheck.Caption = "Disabled"
        Varz.ArmFlag = False
    End If
End Sub
Private Sub EnableCheck_Click()
    If Varz.EnableFlag = False Then
        Trigger = SetTimer(Me.hwnd, 1, 1000, AddressOf Timer1)
        EnableCheck.Caption = "Enabled"
        Varz.EnableFlag = True
    Else
        Trigger = KillTimer(Config.hwnd, 1)
        EnableCheck.Caption = "Disabled"
        Varz.EnableFlag = False
    End If
End Sub
Private Sub Form_Load()
    If Varz.ArmFlag = False Then
        ArmCheck.Value = 0
        EnableCheck.Enabled = False
        EnableCheck.Caption = "Disabled"
    Else
        ArmCheck.Value = 1
        EnableCheck.Caption = "Enabled"
    End If
End Sub
Private Sub HideBut_Click()
    Config.Hide
End Sub
