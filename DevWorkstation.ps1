$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot

Set-WindowsExplorerOptions -EnableShowFileExtensions -EnableShowFullPathInTitleBar
Enable-RemoteDesktop
Disable-InternetExplorerESC

# Posh Tools
choco install powershell4

# Dev Tools
choco install SourceCodePro
choco install GitHub
choco install notepadplusplus.install
choco install SourceTree
choco install VisualStudio2013Professional -InstallArguments "WebTools"

# Investigating/Testing
choco install logparser
choco install fiddler4
choco install PhantomJS

# Productivity
choco install GoogleChrome
choco install Evernote5
choco install keepass
choco install markdownpad2

# Utilities
choco install 7zip
choco install TeraCopy
choco install sumatrapdf.install
choco install vlc
choco install dropbox
choco install webpi
choco install cyberduck
choco install OptiPNG
choco install easyconnect

# Platforms
choco install flashplayerplugin
choco install AdobeAIR
choco install javaruntime
choco install java.jdk
choco install nodejs
choco install golang

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

# VSIS Packages
Install-ChocolateyVsixPackage PowerShellTools http://visualstudiogallery.msdn.microsoft.com/c9eb3ba8-0c59-4944-9a62-6eee37294597/file/112013/6/PowerShellTools.vsix

# Filesystem
New-Item -Path C:\ -Name Temp -ItemType Directory