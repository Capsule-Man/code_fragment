 # 文字列をsecurestringにして、securestringを暗号化した文字列にする

$secureString = ConvertTo-SecureString -string "password1234" -AsPlainText -Force
$SecureString | ConvertFrom-SecureString | Out-File /home/oishouya/lang-train/encrypted.txt

# 暗号化した文字列をsecurestringに変換
$importSecureString = Get-Content c:\temp\encrypted.txt | ConvertTo-SecureString

write-host $StringPassword