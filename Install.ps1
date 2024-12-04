Write-Information "Downloading WinGet and its dependencies..."

if ((Test-Path -Path .\Microsoft.VCLibs.x64.14.00.Desktop.appx -PathType Leaf) -eq $false) {
    Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
}
Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle

if ((Test-Path -Path .\Microsoft.UI.Xaml.2.8.x64.appx -PathType Leaf) -eq $false) {
    Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
}
Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx

if ((Test-Path -Path .\Microsoft.UI.Xaml.2.8.x86.appx -PathType Leaf) -eq $false) {
    Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx -OutFile Microsoft.UI.Xaml.2.8.x64.appx
}
Add-AppxPackage Microsoft.UI.Xaml.2.8.x64.appx

Write-Information "Installing software via WinGet..."

winget source update
winget upgrade Microsoft.AppInstaller
winget update --all

winget install `
    agalwood.Motrix `
    ClashVergeRev.ClashVergeRev `
    CoreyButler.NVMforWindows `
    7zip.7zip `
    ebkr.r2modman `
    Microsoft.VisualStudio.2022.BuildTools `
    Git.Git `
    Google.Chrome `
    Rustlang.Rustup `
    Hex-Rays.IDA.Free `
    OBSProject.OBSStudio `
    Daum.PotPlayer `
    Docker.DockerDesktop `
    Ninja-build.Ninja `
    NetEase.CloudMusic `
    Valve.Steam `
    JetBrains.Toolbox `
    Tencent.WeChat `
    Tencent.TIM `
    Tencent.TencentMeeting `
    WiresharkFoundation.Wireshark `
    JanDeDobbeleer.OhMyPosh `
    DimitriVanHeesch.Doxygen `
    Kitware.CMake `
    GitHub.cli `
    Oracle.JDK.21 `
    Python.Python.3.13 `
    Microsoft.PowerToys `
    Microsoft.PowerShell `
    Microsoft.VisualStudioCode `
    DEVCOM.JetBrainsMonoNerdFont `
    AntibodySoftware.WizTree `
    GNU.Nano

Write-Information "Installing vcpkg..."

if ((Test-Path C:/vcpkg) -eq $false) {
    git clone https://github.com/microsoft/vcpkg C:/vcpkg
}
& "C:/vcpkg/bootstrap-vcpkg.bat"
[Environment]::SetEnvironmentVariable('VCPKG_ROOT', 'C:/vcpkg', 'Machine')
$path = [System.Environment]::GetEnvironmentVariable('Path', 'Machine')
$path = 'C:/vcpkg;' + $path
[System.Environment]::SetEnvironmentVariable('Path', $path, 'Machine')
