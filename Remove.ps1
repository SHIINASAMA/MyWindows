winget remove `
    "MSIX\Clipchamp.Clipchamp_3.0.10220.0_neutral__yxz26nhyzhsrt" `
    "Microsoft.549981C3F5F10_8wekyb3d8bbwe" `
    "Microsoft.BingNews_8wekyb3d8bbwe" `
    "MSIX\Microsoft.BingSearch_1.0.79.0_x64__8wekyb3d8bbwe" `
    "MSIX\Microsoft.BingWeather_4.25.20211.0_x64__8wekyb3d8bbwe" `
    "MSIX\Microsoft.MicrosoftOfficeHub_18.2308.1034.0_x64__8wekyb3d8bbwe" `
    "Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe" `
    "MSIX\Microsoft.People_10.1902.633.0_x64__8wekyb3d8bbwe" `
    "MSIX\Microsoft.MicrosoftStickyNotes_3.6.73.0_x64__8wekyb3d8bbwe" `
    "Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe" `
    "MSIX\Microsoft.YourPhone_0.19051.7.0_x64__8wekyb3d8bbwe" `
    "MSIX\MicrosoftWindows.Client.WebExperience_424.1301.270.9_x64__cw5n1h2txyewy" `
    "microsoft.windowscommunicationsapps_8wekyb3d8bbwe" `
    "MSIX\Microsoft.ZuneVideo_10.19071.19011.0_x64__8wekyb3d8bbwe" `
    "Microsoft.DevHome" `
    "微软电脑管家" "PC Manager" `
    "Microsoft.Teams" `
    "MSIX\Microsoft.GetHelp_10.2302.10601.0_x64__8wekyb3d8bbwe" `
    "Windows Web Experience Pack"

# remove edge exclude webview2
./bin/Remove-Edge.exe /e
