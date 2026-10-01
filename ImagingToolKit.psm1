# ImagingToolKit.psm1

\ = Split-Path \E:\Initialize-ImagingToolKit.ps1 -Parent

# Import all functions
Get-ChildItem (Join-Path \ 'Functions') -Filter '*.ps1' |
    ForEach-Object { . \.FullName }

function Start-ImagingToolkit {
    Show-ITMenu
}
