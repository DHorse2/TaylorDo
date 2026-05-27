New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
New-PSDrive -Name HKCU -PSProvider Registry -Root HKEY_CURRENT_USER
New-PSDrive -Name HKLM -PSProvider Registry -Root HKEY_LOCAL_MACHINE
New-PSDrive -Name HKU  -PSProvider Registry -Root HKEY_USERS
New-PSDrive -Name HKCC -PSProvider Registry -Root HKEY_CURRENT_CONFIG
