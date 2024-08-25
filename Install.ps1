$progressPreference = 'silentlyContinue'
Write-Information "Downloading WinGet and its dependencies..."
Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx -OutFile Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle

winget source update
winget upgrade Microsoft.AppInstaller
winget update --all

winget install `
   agalwood.Motrix `
    ClashVergeRev.ClashVergeRev `
    CoreyButler.NVMforWindows `
    7zip.7zip `
    Microsoft.VisualStudio.2022.BuildTools `
    Git.Git `
    Google.Chrome `
    Hex-Rays.IDA.Free `
    OBSProject.OBSStudio `
    Daum.PotPlayer `
    Docker.DockerDesktop `
    Ninja-build.Ninja `
    Valve.Steam `
    JetBrains.Toolbox `
    Tencent.QQ.NT `
    Tencent.WeChat `
    Tencent.TencentMeeting `
    Tencent.DeskGo `
    WiresharkFoundation.Wireshark `
    DimitriVanHeesch.Doxygen `
    Kitware.CMake `
    GitHub.cli `
    Oracle.JDK.17 `
    Microsoft.PowerToys `
    Microsoft.PowerShell `
    Microsoft.VisualStudioCode `
    DEVCOM.JetBrainsMonoNerdFont `
    AntibodySoftware.WizTree

git clone https://github.com/microsoft/vcpkg C:/vcpkg
& "C:/vcpkg/bootstrap-vcpkg.bat"
