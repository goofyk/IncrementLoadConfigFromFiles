param(
 [string]$CurrConfigFilesPath,
 [string]$PrevConfigFilesPath,
 [string]$FileDiffPath
)

#--diff-filter=m

$watch = [System.Diagnostics.Stopwatch]::StartNew()
$watch.Start()

$TempFile = New-TemporaryFile

Write-Host $TempFile.FullName
#--output=$TempFile

git diff --output=$TempFile --name-status --diff-filter=a $CurrConfigFilesPath $PrevConfigFilesPath

(Get-Content -Path $TempFile -Encoding UTF8).Replace('/', '\').Replace('\\', '\').Replace('"', '') | Set-Content -Encoding UTF8 -Path $TempFile
(Get-Content -Path $TempFile -Encoding UTF8) -split "\t" -match ".{2,}" | Set-Content -Encoding UTF8 -Path $FileDiffPath

$watch.Stop()
Write-Host $watch.Elapsed

Remove-Item $TempFile.FullName