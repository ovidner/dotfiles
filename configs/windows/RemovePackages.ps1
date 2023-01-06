$packages = @(
    "Microsoft.Advertising.Xaml",
    "Microsoft.BingWeather",
    "Microsoft.BingWeather",
    "Microsoft.BioEnrollment",
    "Microsoft.GetHelp",
    "Microsoft.Getstarted",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.MicrosoftStickyNotes",
    "Microsoft.MSPaint",
    "Microsoft.Office.OneNote",
    "Microsoft.People",
    "Microsoft.Print3D"
    "Microsoft.Wallet",
    "Microsoft.Windows.ParentalControls",
    "Microsoft.Windows.Photos",
    "Microsoft.WindowsAlarms",
    "Microsoft.WindowsCalculator",
    "Microsoft.WindowsCamera",
    "Microsoft.WindowsCamera",
    "microsoft.windowscommunicationsapps",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.WindowsMaps",
    "Microsoft.Xbox*"
)

foreach ($package in $packages) {
    Write-Host "Removing $package"
    Get-AppxPackage -Name $package -AllUsers | Remove-AppxPackage -AllUsers
    Get-AppXProvisionedPackage -Online | Where-Object DisplayName -EQ $package | Remove-AppxProvisionedPackage -Online
}
