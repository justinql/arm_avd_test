
#forcing the execution
Set-ExecutionPolicy Bypass -Scope Process -Force

#installing chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


#getting current directory
$CurrentLocation= Get-Location 

#Chocolately xmlfile downlaod
$URL= "https://raw.githubusercontent.com/justinql/arm_avd_test/scheduled-taks/Chocolately_upgrade.xml" 
Invoke-WebRequest $URL -OutFile "Chocolately_upgrade.xml" 


#office xmlfile update
$URL2= "https://raw.githubusercontent.com/justinql/arm_avd_test/scheduled-taks/Microsoft_Office_weekly_update.xml" 
Invoke-WebRequest $URL2 -OutFile "Microsoft_Office_weekly_update.xml" 



#creating chocolately task
Register-ScheduledTask -Xml (get-content $CurrentLocation"\Chocolately_upgrade.xml" | out-string) -TaskName "Chocolately upgrade" -TaskPath "\Chocolatety" -force

#creating office task
Register-ScheduledTask -Xml (get-content $CurrentLocation"\Microsoft_Office_weekly_update.xml" | out-string) -TaskName "Microsoft Office weekly update"  -TaskPath "\OfficeUpdate" -force


#VS Code install
#Visual Studio
choco install -y vscode 
choco install -y sql-server-management-studio
choco upgrade -y nodejs --version "'16.13.2'" 