$credential = Get-Credential "{username}"
$PSSession = New-PSSession "{TergetServer}" -Credential $credential

# コマンド実行
Invoke-Command -Session $PSSession -ScriptBlock { dir c:\ }

# ローカルのスクリプト実行
Invoke-Command TergetServer -FilePath c:\Temp\autowindowsupdate.ps1 -ArgumentList "aaaa"