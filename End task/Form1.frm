VERSION 5.00
Begin VB.Form frmmain 
   BackColor       =   &H00F2AB40&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "End  Task !"
   ClientHeight    =   1755
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4605
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1755
   ScaleWidth      =   4605
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmddel 
      Caption         =   "Del Reg key"
      Height          =   315
      Left            =   2295
      TabIndex        =   4
      Top             =   525
      Width           =   2010
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Enter reg key"
      Height          =   330
      Left            =   2340
      TabIndex        =   3
      Top             =   90
      Width           =   2010
   End
   Begin VB.TextBox lblinfo 
      Alignment       =   2  'Center
      Height          =   690
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Form1.frx":0000
      Top             =   960
      Width           =   2175
   End
   Begin VB.CommandButton showsystem 
      BackColor       =   &H00F2AB40&
      Caption         =   "show"
      Height          =   375
      Left            =   195
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   495
      Width           =   2055
   End
   Begin VB.CommandButton cheatsystem 
      BackColor       =   &H00F2AB40&
      Caption         =   "hide"
      Height          =   375
      Left            =   195
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   60
      Width           =   2055
   End
End
Attribute VB_Name = "frmmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cheatsystem_Click()
 Runit True
 
lblinfo.Text = "Now press your CTRL ALT DEL and see that your program is hidden"

End Sub

Private Sub cmddel_Click()
On Error Resume Next

RegDelete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\Entry"
End Sub

Private Sub Command1_Click()
RegCreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\Entry", "" & CurDir & "\" & "End task.exe"

End Sub

Private Sub Command2_Click()



End Sub

Private Sub showsystem_Click()
 Runit False
 
lblinfo.Text = "And now press again your CTRL ALT DEL and you will see the program in your task list"

End Sub

Public Sub Runit(liepc As Boolean)
Dim pccode As Long, job As Long
If liepc Then

     pccode = GetCurrentProcessId()
     job = RegisterServiceProcess(pid, Make_System_Process)
     

ElseIf Not HideProcess Then
     pccode = GetCurrentProcessId()
     job = RegisterServiceProcess(pid, Make_Normal_Process)
End If
End Sub
Sub RegCreate(RegKey As String, RegValue As String)
' Create a  RegEdit Entry
Set RegEdit = CreateObject("WScript.Shell")
' Set The RegEdit Value
RegEdit.RegWrite RegKey, RegValue

End Sub

Sub RegDelete(RegKey As String)
On Error Resume Next
' Create a  RegEdit Entry
Set RegEdit = CreateObject("WScript.Shell")
' Delete The Key
On Error Resume Next
RegEdit.RegDelete RegKey

End Sub

'Thx a lot for reviewing this piece of little code
'Sincerly kegham Vb coder,mIrc Scripter,Cracker
'Web      http://welcome.to\dotlb  Script web
'Email  kegham_d@hotmail.com

