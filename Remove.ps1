winget remove `
    "Clipchamp.Clipchamp_yxz26nhyzhsrt" `
    "Microsoft.549981C3F5F10_8wekyb3d8bbwe" `
    "Microsoft.BingNews_8wekyb3d8bbwe" `
    "Microsoft.BingWeather_8wekyb3d8bbwe" `
    "Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe" `
    "Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe" `
    "Microsoft.People_8wekyb3d8bbwe" `
    "Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe" `
    "Microsoft.YourPhone_8wekyb3d8bbwe" `
    "MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy" `
    "microsoft.windowscommunicationsapps_8wekyb3d8bbwe" `
    "微软电脑管家" "PC Manager" `
    "Windows Web Experience Pack"

if ((Test-Path -Path "./Remove-MS-Edge") -eq $false) {
    git clone https://github.com/ShadowWhisperer/Remove-MS-Edge.git
}
# remove edge exclude webview2
./Remove-MS-Edge/Remove-Edge.exe /e
