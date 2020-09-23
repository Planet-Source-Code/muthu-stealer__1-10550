VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   Caption         =   "S t E a L e R "
   ClientHeight    =   2550
   ClientLeft      =   9015
   ClientTop       =   5670
   ClientWidth     =   2745
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   DrawMode        =   5  'Not Copy Pen
   DrawStyle       =   2  'Dot
   FillColor       =   &H80000012&
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000018&
   Icon            =   "Reveal.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   NegotiateMenus  =   0   'False
   Picture         =   "Reveal.frx":08CA
   ScaleHeight     =   2550
   ScaleWidth      =   2745
   ShowInTaskbar   =   0   'False
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   6000
      Top             =   720
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      ForeColor       =   &H80000018&
      Height          =   210
      Left            =   360
      TabIndex        =   0
      Top             =   360
      Width           =   2055
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function GetCursorPos Lib "user32" (lpPoint As Moo) As Long
Private Declare Function WindowFromPointXY Lib "user32" Alias "WindowFromPoint" (ByVal xPoint As Long, ByVal yPoint As Long) As Long
Private Declare Function SendMessageByNum& Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long)
Private Declare Function SendMessageByString Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As String) As Long

Private Type Moo
    x As Long
    Y As Long
    End Type

Function Hoover()
    Dim nKm1 As Moo
    Dim nKmX As Long
    Dim nKmY As Long
    Call GetCursorPos(nKm1)
    nKmX = nKm1.x
    nKmY = nKm1.Y
    Hoover = WindowFromPointXY(nKmX, nKmY)
End Function


Function Get_Text(child)
    Dim GetTrim
    Dim TrimSpace$
    Dim getstring
    GetTrim = SendMessageByNum(child, 14, 0&, 0&)
    TrimSpace$ = Space$(GetTrim)
    getstring = SendMessageByString(child, 13, GetTrim + 1, TrimSpace$)
    Get_Text = TrimSpace$
End Function


Private Sub Form_KeyPress(KeyAscii As Integer)

    If vbKeyEscape Then
        End
    End If
    
End Sub

Private Sub Form_Resize()
    Label1.Width = Me.ScaleWidth
    Label1.Height = Me.ScaleHeight
    
End Sub

Private Sub Timer1_Timer()
    Label1.Caption = Get_Text(Hoover)

    If Label1.Width >= 2050 Then
        Label1.Width = 2055
        Label1.WordWrap = True
        Else
        Label1.WordWrap = False
    End If
    
End Sub
