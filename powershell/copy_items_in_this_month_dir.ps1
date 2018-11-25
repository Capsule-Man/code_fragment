# 今月のディレクトリを作成し、そこにcsvをコピーする

$from = '/home/oishouya/lang-train/powershell/*.csv'
$to = '/home/oishouya/Downloads/' + (Get-Date -Format 'yyyyMM')

if (!(Test-Path $to)) {
    New-Item $to -ItemType Directory
}

Copy-Item $from $to
