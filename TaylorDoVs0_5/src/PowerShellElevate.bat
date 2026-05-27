Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

powershell -ExecutionPolicy Bypass -File .\AddVsCodiumToExplorer.ps1

Unblock-File .\MyDefragUpdateLive.ps1

Get-ChildItem *.ps1 | Unblock-File

# One-time: install vsce
npm install -g @vscode/vsce

