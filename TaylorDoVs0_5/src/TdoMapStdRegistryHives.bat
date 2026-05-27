@echo off
powershell -ExecutionPolicy Bypass -Command "
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT

$vscodium = 'C:\Users\david\AppData\Local\Programs\VSCodium\VSCodium.exe'

New-Item -Path 'HKCR:\Directory\shell\VSCodium' -Force
Set-ItemProperty -Path 'HKCR:\Directory\shell\VSCodium' -Name '(Default)' -Value 'Open with VSCodium'
Set-ItemProperty -Path 'HKCR:\Directory\shell\VSCodium' -Name 'Icon' -Value '$vscodium,0'
New-Item -Path 'HKCR:\Directory\shell\VSCodium\command' -Force
Set-ItemProperty -Path 'HKCR:\Directory\shell\VSCodium\command' -Name '(Default)' -Value \`\"\$vscodium\`\" \`\"%V\`\"

New-Item -Path 'HKCR:\Directory\Background\shell\VSCodium' -Force
Set-ItemProperty -Path 'HKCR:\Directory\Background\shell\VSCodium' -Name '(Default)' -Value 'Open with VSCodium'
Set-ItemProperty -Path 'HKCR:\Directory\Background\shell\VSCodium' -Name 'Icon' -Value '$vscodium,0'
New-Item -Path 'HKCR:\Directory\Background\shell\VSCodium\command' -Force
Set-ItemProperty -Path 'HKCR:\Directory\Background\shell\VSCodium\command' -Name '(Default)' -Value \`\"\$vscodium\`\" \`\"%V\`\"
"
pause
