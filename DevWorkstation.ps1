Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions

# Posh Tools
cinst powershell4
cinst console-devel
cinst PowerGUI

# Dev Tools
cinst SourceCodePro
cinst GitHub
cinst poshgit
cinst notepadplusplus.install

# Investigating/Testing
cinst logparser
cinst fiddler4
cinst PhantomJS

# Productivity
cinst GoogleChrome
cinst Evernote5
cinst keepass

# Utilities
cinst 7zip.install
cinst TeraCopy
cinst sumatrapdf
cinst vlc
cinst dropbox
cinst webpi

# Platforms
cinst DotNet4.5
cinst flashplayerplugin
cinst AdobeAIR
cinst javaruntime
cinst java.jdk
cinst nodejs.install
cinst ruby
cinst golang

Install-WindowsUpdate -AcceptEula

Install-ChocolateyPinnedTaskBarItem "$env:localappdata\Google\Chrome\Application\chrome.exe"
Install-ChocolateyPinnedTaskBarItem "$env:windir\explorer.exe"
Install-ChocolateyPinnedTaskBarItem "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe"
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\console\console.exe"
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\KeePass Password Safe 2\KeePass.exe"
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\Notepad++\notepad++.exe"
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\Evernote\Evernote\Evernote.exe"

