
#forcing the execution
Set-ExecutionPolicy Bypass -Scope Process -Force


#getting current directory
$CurrentLocation= Get-Location 

#Chocolately xmlfile downlaod
$URL= "https://community.chocolatey.org/ChocolateyInstall.ps1" 
Invoke-WebRequest $URL -OutFile "ChocolateyInstall.ps1" 

.$CurrentLocation"\ChocolateyInstall.ps1" -y -wait

#Chocolately xmlfile downlaod
$URL1= "https://raw.githubusercontent.com/justinql/arm_avd_test/scheduled-taks/Chocolately_upgrade.xml" 
Invoke-WebRequest $URL1 -OutFile "Chocolately_upgrade.xml" 


#office xmlfile update
$URL2= "https://raw.githubusercontent.com/justinql/arm_avd_test/scheduled-taks/Microsoft_Office_weekly_update.xml" 
Invoke-WebRequest $URL2 -OutFile "Microsoft_Office_weekly_update.xml" 



#creating chocolately task
Register-ScheduledTask -Xml (get-content $CurrentLocation"\Chocolately_upgrade.xml" | out-string) -TaskName "Chocolately upgrade" -TaskPath "\Chocolatety" -force

#creating office task
Register-ScheduledTask -Xml (get-content $CurrentLocation"\Microsoft_Office_weekly_update.xml" | out-string) -TaskName "Microsoft Office weekly update"  -TaskPath "\OfficeUpdate" -force


#VS Code install
#Visual Studio
choco install  vscode -y -wait
choco install  sql-server-management-studio -y -wait
choco upgrade  nodejs --version "'16.13.2'" -y -wait
choco install visualstudio2022enterprise --package-parameters "--add Microsoft.VisualStudio.Workload.CoreEditor --add Microsoft.VisualStudio.Workload.Data --add Microsoft.VisualStudio.Workload.DataScience --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Workload.Node --add Microsoft.VisualStudio.Workload.Office  --add  Microsoft.VisualStudio.Workload.VisualStudioExtension  --includeRecommended --passive --locale en-CA" -y -wait
choco install googlechrome
choco install texstudio
choco install miktex
choco install strawberryperl




