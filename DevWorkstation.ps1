$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot

Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
Enable-RemoteDesktop
Disable-InternetExplorerESC

# Posh Tools
cinst powershell4
cinst console-devel
cinst PowerGUI
cinst PsGet

# Dev Tools
cinst SourceCodePro
cinst GitHub
cinst notepadplusplus.install
cinst SourceTree
cinst VisualStudio2013Professional -InstallArguments "WebTools"
if (Test-PendingReboot) { Invoke-Reboot }

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
cinst easyconnect

# Platforms
cinst flashplayerplugin
cinst AdobeAIR
cinst javaruntime
cinst java.jdk
cinst nodejs.install
cinst ruby
cinst golang

# Download Configs
<# Does not seem to work
$wc = New-Object -TypeName System.Net.WebClient
$consoleConfig = 'https://raw.github.com/cdhunt/Boxstarter/master/config/console/console.xml'
$npppConfig = 'https://raw.github.com/cdhunt/Boxstarter/master/config/notepad++/config.xml'
$npppLangs = 'https://raw.github.com/cdhunt/Boxstarter/master/config/notepad++/langs.xml'
$npppStylers = 'https://raw.github.com/cdhunt/Boxstarter/master/config/notepad++/stylers.xml'

$wc.DownloadString($consoleConfig) | Set-Content "$env:appdata\console\console.xml"
$wc.DownloadString($npppConfig) | Set-Content "$env:appdata\Notepad++\config.xml"
$wc.DownloadString($npppLangs) | Set-Content "$env:appdata\Notepad++\langs.xml"
$wc.DownloadString($npppStylers) | Set-Content "$env:appdata\Notepad++\stylers.xml"
#>

if (Test-PendingReboot) { Invoke-Reboot }

# Windows Updates
Install-WindowsUpdate -AcceptEula
if (Test-PendingReboot) { Invoke-Reboot }

# Taskbar items
Install-ChocolateyPinnedTaskBarItem "$env:localappdata\Google\Chrome\Application\chrome.exe"
Install-ChocolateyPinnedTaskBarItem "$env:windir\explorer.exe"
Install-ChocolateyPinnedTaskBarItem "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe"
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\console\console.exe"
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\KeePass Password Safe 2\KeePass.exe"
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\Notepad++\notepad++.exe"
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\Evernote\Evernote\Evernote.exe"

# Posh Modules Requires PSGet
Install-Module -nugetpackageid PSate
Install-Module PSReadLine
Install-Module psake
Install-Module PoSHServer
Install-Module posh-git

# VSIS Packages
Install-ChocolateyVsixPackage PowerShellTools http://visualstudiogallery.msdn.microsoft.com/c9eb3ba8-0c59-4944-9a62-6eee37294597/file/112013/6/PowerShellTools.vsix

# Filesystem
New-Item -Path C:\ -Name Temp -ItemType Directory

# Posh Profile
@'
Import-Module PSReadLine
Import-Module  posh-git
Set-Location C:\temp
New-Alias -Name Mute -Value Set-DefaultAudioDeviceMute
New-Alias -Name Vol -Value Set-DefaultAudioDeviceVolume
'@ | Set-Content $profile

if (Test-PendingReboot) { Invoke-Reboot }
