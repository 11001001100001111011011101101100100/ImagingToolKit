function Invoke-ITToolDownload {
    \ = Join-Path (Split-Path \E:\Initialize-ImagingToolKit.ps1 -Parent) 'Config\\Packages.json'
    if (-not (Test-Path \)) {
        Write-Host 'No Packages.json found.'
        return
    }
    \ = Get-Content \ | ConvertFrom-Json
    \ = Split-Path \E:\Initialize-ImagingToolKit.ps1 -Parent
    foreach (\ in \.Tools) {
        \ = Join-Path \ ('Tools\\' + \.Name + '.exe')
        Invoke-ITSmartDownload -PrimaryUrl \.Url -BackupUrl \.BackupUrl -GitUrl \.GitUrl -TargetPath \
    }
}
