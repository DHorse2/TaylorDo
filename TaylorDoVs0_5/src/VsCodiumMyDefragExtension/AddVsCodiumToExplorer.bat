@echo off

$Cmd = Get-Command codium -ErrorAction SilentlyContinue
if ($Cmd) {
    $VsCodiumExe = $Cmd.Source
}
else {
    $Candidates = @(
        "$env:ProgramFiles\VSCodium\VSCodium.exe",
        "${env:ProgramFiles(x86)}\VSCodium\VSCodium.exe",
        "$env:LOCALAPPDATA\Programs\VSCodium\VSCodium.exe"
    )

    $VsCodiumExe = $Candidates |
        Where-Object { Test-Path $_ } |
        Select-Object -First 1
}

$PortablePath = Join-Path $PSScriptRoot "data\extensions"

if (Test-Path $PortablePath) {
    $ExtensionsPath = $PortablePath
}
else {
    $ExtensionsPath = Join-Path $env:USERPROFILE ".vscode-oss\extensions"
}

reg add "HKEY_CLASSES_ROOT\Directory\shell\VSCodium" /ve /d "Open with VSCodium" /f
reg add "HKEY_CLASSES_ROOT\Directory\shell\VSCodium" /v "Icon" /d "\"%VsCodiumExe%\",0" /f
reg add "HKEY_CLASSES_ROOT\Directory\shell\VSCodium\command" /ve /d "\"%VsCodiumExe%\" \"%%1\"" /f

reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\VSCodium" /ve /d "Open with VSCodium" /f
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\VSCodium" /v "Icon" /d "\"%VsCodiumExe%\",0" /f
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\VSCodium\command" /ve /d "\"%VsCodiumExe%\" \"%%W\"" /f

echo Done.
pause