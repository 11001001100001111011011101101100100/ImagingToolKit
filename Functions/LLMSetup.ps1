function Invoke-ITLLMSetup {
    \ = Join-Path (Get-ITConfigPath) 'Models.json'
    if (-not (Test-Path \)) {
        Write-Host 'No Models.json found.'
        return
    }
    \ = Get-Content \ | ConvertFrom-Json
    \ = Split-Path \E:\Initialize-ImagingToolKit.ps1 -Parent
    foreach (\ in \.Models) {
        \ = Join-Path \ ('LocalLLM\\Models\\' + \.FileName)
        Invoke-ITSmartDownload -PrimaryUrl \.Url -BackupUrl \.BackupUrl -GitUrl \.GitUrl -TargetPath \
    }
}
