Set-ExecutionPolicy Bypass -Scope Process -Force

Register-ScheduledTask -Xml (get-content 'https://chocolately_upgrade.xml' | out-string) -TaskName "Chocolately upgrade" -force

Register-ScheduledTask -Xml (get-content 'https://Microsoft_Office_weekly_update.xml' | out-string) -TaskName "Microsoft Office weekly update" -force




