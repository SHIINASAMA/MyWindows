winget install starship
Write-Output "`nInvoke-Expression (&starship init powershell)" >> $PROFILE

$LangList = New-WinUserLanguageList en-US
$LangList.Add("zh-Hans-CN")
$LangList.Add("ja-JP")
Set-WinUserLanguageList $LangList

# 资源管理器显示磁盘
$RegistryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$Name = "LaunchTo"
$Value = 1

if (Test-Path $RegistryPath) {
    Set-ItemProperty -Path $RegistryPath -Name $Name -Value $Value
} else {
    New-Item -Path $RegistryPath -Force | Set-ItemProperty -Name $Name -Value $Value
}

# 显示文件扩展名
$Name = "HideFileExt"
$Value = 0
Set-ItemProperty -Path $RegistryPath -Name $Name -Value $Value

# 显示隐藏文件
$Name = "Hidden"
$Value = 1
Set-ItemProperty -Path $RegistryPath -Name $Name -Value $Value

# 显示受保护的操作系统文件
$Name = "ShowSuperHidden"
$Value = 1
Set-ItemProperty -Path $RegistryPath -Name $Name -Value $Value

# 显示驱动器号（不隐藏空的驱动器）
$Name = "HideDrivesWithNoMedia"
$Value = 0
Set-ItemProperty -Path $RegistryPath -Name $Name -Value $Value

# 通知资源管理器重新加载设置
Stop-Process -Name explorer -Force
Start-Process explorer.exe