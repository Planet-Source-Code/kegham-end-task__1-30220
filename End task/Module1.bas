Attribute VB_Name = "Module1"
Public Declare Function GetCurrentProcess Lib "kernel32" () As Long
Public Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessID As Long, ByVal dwType As Long) As Long
Public Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Public Const Make_System_Process = 1
Public Const Make_Normal_Process = 0
