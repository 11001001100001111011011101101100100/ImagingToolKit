function Invoke-ITAutoUpdate {
    \ = Join-Path (Split-Path \E:\Initialize-ImagingToolKit.ps1 -Parent) 'Config'
    \ = Join-Path \ 'Packages.json'
    \  = Join-Path \ 'VERSION.txt'

    \ = 'https://raw.githubusercontent.com/11001001100001111011011101101100100/ImagingToolKit/main'
    \ = "\/Packages.json"
    \  = "\/VERSION.txt"

    Write-Host 'Checking GitHub for metadata...'
    try {
        \ = Invoke-WebRequest -Uri \ -UseBasicParsing -ErrorAction Stop
        \ = Invoke-WebRequest -Uri \ -UseBasicParsing -ErrorAction Stop

        Write-File \ \.Content.Trim()
        Write-File \ \.Content

        Write-Host "✔ Updated metadata to version \.Content"
    } catch {
        Write-Host '⚠ Unable to reach GitHub.'
    }
}
