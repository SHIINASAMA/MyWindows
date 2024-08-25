winget install starship
Write-Output "`nInvoke-Expression (&starship init powershell)" >> $PROFILE

$LangList = New-WinUserLanguageList en-US
$LangList.Add("zh-Hans-CN")
$LangList.Add("ja-JP")
Set-WinUserLanguageList $LangList

# 设置资源管理器默认显示此电脑
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

# 指定锁屏背景图片的路径
$lockScreenImagePath = "./static/background.jpg"

# 指定桌面背景图片的路径
$wallpaperPath = "./static/background.jpg"

# 设置锁屏背景的注册表项
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$Name = "LockScreenImage"
$Value = $lockScreenImagePath

if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force
}
Set-ItemProperty -Path $RegistryPath -Name $Name -Value $Value

# 禁用“Windows 聚焦”功能，确保使用固定背景
$RegistryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
$Name = "RotatingLockScreenEnabled"
$Value = 0

if (Test-Path $RegistryPath) {
    Set-ItemProperty -Path $RegistryPath -Name $Name -Value $Value
} else {
    New-Item -Path $RegistryPath -Force | Set-ItemProperty -Name $Name -Value $Value
}

# 设置桌面背景
$code = @"
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

# 编译 C# 代码以调用 Windows API 更改壁纸
Add-Type -TypeDefinition $code

# SPI_SETDESKWALLPAPER = 20, SPIF_UPDATEINIFILE = 0x01, SPIF_SENDWININICHANGE = 0x02
[Wallpaper]::SystemParametersInfo(20, 0, $wallpaperPath, 0x01 -bor 0x02)

# 通知资源管理器重新加载设置
Stop-Process -Name explorer -Force
Start-Process explorer.exe
