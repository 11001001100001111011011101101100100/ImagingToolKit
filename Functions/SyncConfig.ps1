function Invoke-ITSyncConfig {
    \ = \
    \ = \[0]
    foreach (\ in \) {
        if (-not (Test-Path \)) { New-Item -ItemType Directory -Path \ | Out-Null }
    }
    \ = Get-ChildItem \ -File -ErrorAction SilentlyContinue
    foreach (\ in \) {
        foreach (\ in \) {
            \ = Join-Path \ \.Name
            Copy-Item \.FullName \ -Force
        }
    }
    Write-Host '✔ Synced config across USB/OneDrive/Documents.'
}
