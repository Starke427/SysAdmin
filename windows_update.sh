Set-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NetFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -Value '1' -Type DWord
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\.NetFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -Value '1' -Type DWord
Install-Module -Name PSWindowsUpdate
Get-Package -Name PSWindowsUpdate
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot | Out-File "C:\$(Get-Date -f yyyy-MM-dd)-MSUpdates.log" -Force

# Run remotely after being installed (Requires WinRM)
#$Nodes = "host1,host2,host3"
#Invoke-WUJob -ComputerName $Nodes -Script {ipmo PSWindowsUpdate; Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot} -RunNow -Confirm:$false | Out-File "C:\$Nodes-$(Get-Date -f yyyy-MM-dd)-MSUpdates.log" -Force
