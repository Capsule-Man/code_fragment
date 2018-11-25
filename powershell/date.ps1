# 201811
Get-Date -F yyyyMM 

# 20181111
Get-Date -F yyyyMMdd

# 前月
(Get-Date).AddMonths(-1).ToString("MM")

# 前月を名前とするディレクトリを作成
$lastMonth = (Get-Date).AddMonths(-1).ToString("yyyyMM")
New-Item $lastMonth -ItemType Directory
