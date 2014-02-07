Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions

# Posh Tools
cinst powershell4
cinst console-devel
cinst PowerGUI
cinst PsGet

# Dev Tools
cinst SourceCodePro
cinst GitHub
cinst poshgit
cinst notepadplusplus.install
cinst VisualStudio2013Professional -InstallArguments "WebTools"

# Investigating/Testing
cinst logparser
cinst fiddler4
cinst PhantomJS

# Productivity
cinst GoogleChrome
cinst Evernote5
cinst keepass
cinst markdownpad2
cinst Office365HomePremium

# Utilities
cinst 7zip.install
cinst TeraCopy
cinst sumatrapdf
cinst vlc
cinst dropbox
cinst webpi
cinst cyberduck.install
cinst OptiPNG

# Platforms
cinst DotNet4.5
cinst flashplayerplugin
cinst AdobeAIR
cinst javaruntime
cinst java.jdk
cinst nodejs.install
cinst ruby
cinst golang

# Console Config
$url = 'https://raw.github.com/cdhunt/Boxstarter/master/config/console.xml'
$wc = New-Object -TypeName System.Net.WebClient
$wc.DownloadString($url) | Set-Content "$env:appdata\console\console.xml"

# Windows Updates
Install-WindowsUpdate -AcceptEula

# Taskbar items
Install-ChocolateyPinnedTaskBarItem "$env:localappdata\Google\Chrome\Application\chrome.exe"
Install-ChocolateyPinnedTaskBarItem "$env:windir\explorer.exe"
Install-ChocolateyPinnedTaskBarItem "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe"
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\console\console.exe"
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\KeePass Password Safe 2\KeePass.exe"
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\Notepad++\notepad++.exe"
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\Evernote\Evernote\Evernote.exe"

# Posh Modules Requires PSGet
Install-Module Pester
Install-Module PSReadLine
Install-Module psake
Install-Module PoSHServer

# VSIS Packages
Install-ChocolateyVsixPackage PowerShellTools http://visualstudiogallery.msdn.microsoft.com/c9eb3ba8-0c59-4944-9a62-6eee37294597/file/112013/6/PowerShellTools.vsix

# Filesystem
New-Item -Path C:\ -Name Temp -ItemType Directory

# Posh Profile
@'
Import-Module PSReadLine
Set-Location C:\temp
New-Alias -Name Mute -Value Set-DefaultAudioDeviceMute
New-Alias -Name Vol -Value Set-DefaultAudioDeviceVolume
'@ | Set-Content $profile

if (Test-PendingReboot) { Invoke-Reboot }

