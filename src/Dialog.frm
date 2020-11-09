VERSION 5.00
Begin VB.Form DialogShut 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   960
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   705
   LinkTopic       =   "Form1"
   ScaleHeight     =   960
   ScaleWidth      =   705
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Hicks 
      Default         =   -1  'True
      Height          =   255
      Left            =   1080
      TabIndex        =   0
      Top             =   240
      Width           =   255
   End
   Begin VB.Frame Frame1 
      Height          =   1080
      Left            =   -15
      TabIndex        =   1
      Top             =   -105
      Width           =   735
      Begin VB.CommandButton CancelBut 
         Caption         =   "&Cancel"
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
         Left            =   75
         TabIndex        =   3
         TabStop         =   0   'False
         Top             =   765
         Width           =   600
      End
      Begin VB.Label Iter 
         AutoSize        =   -1  'True
         Caption         =   "3"
         Height          =   195
         Left            =   300
         TabIndex        =   4
         Top             =   525
         Width           =   90
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Caption         =   "Shutting down..."
         BeginProperty Font 
            Name            =   "Small Fonts"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   75
         TabIndex        =   2
         Top             =   165
         Width           =   615
      End
   End
End
Attribute VB_Name = "DialogShut"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CancelBut_Click()
    API.Cancel
End Sub
Public Sub Check()
    Iter.Caption = CInt(Iter.Caption) - 1
    If CInt(Iter.Caption) = -1 Then
        API.Shutdown
    End If
End Sub
Private Sub Form_Load()
    Iter.Caption = 3
    Trigger = SetTimer(Me.hwnd, 1, 1000, AddressOf Timer2)
End Sub
