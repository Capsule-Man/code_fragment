$csv = './test.csv'
$data = Get-Content $csv | % { $_ -replace "201809", "201810" }
$data | Out-File $csv -Encoding UTF8