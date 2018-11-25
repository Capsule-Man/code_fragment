$cred = Get-Credential username

Copy-Item \\server\share\*.* C:\test\ -Credential $cred
