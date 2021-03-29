$taskAction = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument 'Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot | Out-File "C:\$(Get-Date -f yyyy-MM-dd)-MSUpdates.log" -Force
'
$taskAction
$taskTrigger = New-ScheduledTaskTrigger -Weekly -WeeksInterval 2 -DaysOfWeek Sunday -At 3am
$tasktrigger
$taskName = "ApplyWindowsUpdates"
$description = "Apply Windows Updates Biweekly on Sundays at 3am."
Register-ScheduledTask -TaskName $taskName -Action $taskAction -Trigger $taskTrigger -Description $description -RunLevel Highest
