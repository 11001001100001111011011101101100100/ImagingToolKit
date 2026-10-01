function Invoke-ITSmartDownload {
    param(
        [string]\,
        [string]\,
        [string]\,
        [string]\
    )

    if (Test-Path \) {
        Write-Host "✔ File exists: \"
        return
    }

    \ = Split-Path \ -Parent
    if (-not (Test-Path \)) { New-Item -ItemType Directory -Path \ | Out-Null }

    try {
        Write-Host "Downloading (primary): \"
        Invoke-WebRequest -Uri \ -OutFile \ -ErrorAction Stop
        Write-Host '✔ Downloaded (primary).'
        return
    } catch { Write-Host '❌ Primary failed.' }

    if (\) {
        try {
            Write-Host "Downloading (backup): \"
            Invoke-WebRequest -Uri \ -OutFile \ -ErrorAction Stop
            Write-Host '✔ Downloaded (backup).'
            return
        } catch { Write-Host '❌ Backup failed.' }
    }

    try {
        Write-Host 'Trying curl fallback...'
        curl.exe -L \ -o \
        if (Test-Path \) {
            Write-Host '✔ Downloaded via curl.'
            return
        }
    } catch { Write-Host '❌ curl failed.' }

    Write-Host "⚠ All download methods failed for \."
}
