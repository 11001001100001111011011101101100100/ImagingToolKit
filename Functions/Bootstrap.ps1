function Invoke-ITBootstrap {
    if (\System.Management.Automation.PSVersionHashTable.PSVersion.Major -lt 7) {
        \ = Get-Command pwsh.exe -ErrorAction SilentlyContinue
        if (-not \) {
            Write-Host 'Installing PowerShell 7...'
            \ = Join-Path \C:\Users\david\AppData\Local\Temp 'pwsh.msi'
            Invoke-WebRequest -Uri 'https://aka.ms/powershell-latest-win' -OutFile \
            Start-Process msiexec.exe -ArgumentList "/i "\" /qn" -Wait
        }
        Write-Host 'Relaunching under pwsh...'
        & pwsh.exe -ExecutionPolicy Bypass -File \E:\Initialize-ImagingToolKit.ps1
        exit
    }
}

function Show-ITMenu {
    Invoke-ITBootstrap

    while (\True) {
        Write-Host "
==============================="
        Write-Host "   IMAGING TOOLKIT MENU"
        Write-Host "==============================="
        Write-Host "1. Create Folder Structure"
        Write-Host "2. Download Tools"
        Write-Host "3. Export Drivers"
        Write-Host "4. Download Drivers"
        Write-Host "5. Auto-Update"
        Write-Host "6. Exit"
        \ = Read-Host 'Select option'
        switch (\) {
            '1' { New-ITFolderStructure }
            '2' { Invoke-ITToolDownload }
            '3' { Invoke-ITDriverExport }
            '4' { Invoke-ITDriverDownload }
            '5' { Invoke-ITAutoUpdate }
            '6' { break }
            default { Write-Host 'Invalid choice.' }
        }
    }
}
