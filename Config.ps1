Write-Output "`noh-my-posh init pwsh --config `"$env:POSH_THEMES_PATH\ys.omp.json`" | Invoke-Expression" >> $PROFILE

$LangList = New-WinUserLanguageList en-US
$LangList.Add("zh-Hans-CN")
$LangList.Add("ja-JP")
Set-WinUserLanguageList -LanguageList $LangList -Force

# 设置资源管理器默认显示此电脑
$RegistryPath = "HKCU:\SOFTWARE\Miscrosoft\Windows\CurrentVersion\Explorer\Advanced"
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
# $Name = "Hidden"
# $Value = 1
# Set-ItemProperty -Path $RegistryPath -Name $Name -Value $Value

# 显示受保护的操作系统文件
$Name = "ShowSuperHidden"
$Value = 1
Set-ItemProperty -Path $RegistryPath -Name $Name -Value $Value

# 显示驱动器号（不隐藏空的驱动器）
$Name = "HideDrivesWithNoMedia"
$Value = 0
Set-ItemProperty -Path $RegistryPath -Name $Name -Value $Value

# 关闭任务栏搜索框
$RegistryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search"
$Name = "SearchboxTaskbarMode"
$Value = 0
if (Test-Path $RegistryPath) {
    Set-ItemProperty -Path $RegistryPath -Name $Name -Value $Value
} else {
    New-Item -Path $RegistryPath -Force | Set-ItemProperty -Name $Name -Value $Value
}

# 禁用开始菜单的网络搜索功能和云搜索功能
$RegistryPath = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer"
$Name1 = "DisableSearchBoxSuggestions"
$Value1 = 1
$Name2 = "ConnectedSearchUseWeb"
$Value2 = 0
$Name3 = "ConnectedSearchUseWebOverMeteredConnections"
$Value3 = 0
$Name4 = "DisableCloudSearch"
$Value4 = 1
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force
}
Set-ItemProperty -Path $RegistryPath -Name $Name1 -Value $Value1
Set-ItemProperty -Path $RegistryPath -Name $Name2 -Value $Value2
Set-ItemProperty -Path $RegistryPath -Name $Name3 -Value $Value3
Set-ItemProperty -Path $RegistryPath -Name $Name4 -Value $Value4

# 通知资源管理器重新加载设置
Stop-Process -Name explorer -Force
Start-Process explorer.exe
