function Invoke-ITDriverExport {
    \ = Split-Path \E:\Initialize-ImagingToolKit.ps1 -Parent
    \ = Join-Path \ 'Drivers\\Exported'
    if (-not (Test-Path \)) { New-Item -ItemType Directory -Path \ | Out-Null }
    Write-Host "Exporting drivers to \..."
    dism /online /export-driver /destination:"\"
}
