function New-ITFolderStructure {
    \ = Split-Path \E:\Initialize-ImagingToolKit.ps1 -Parent
    \ = @(
        'Tools',
        'Tools\\PowerShell',
        'Tools\\Python',
        'Tools\\WebDev',
        'Tools\\SQL',
        'Tools\\DevExtras',
        'LocalLLM',
        'LocalLLM\\Models',
        'Drivers',
        'Logs'
    )
    foreach (\ in \) {
        \ = Join-Path \ \
        if (-not (Test-Path \)) {
            New-Item -ItemType Directory -Path \ | Out-Null
            Write-Host "Created: \"
        }
    }
}
