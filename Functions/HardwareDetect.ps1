function Invoke-ITHardwareDetect {
    \ = [PSCustomObject]@{
        ComputerName = \TJDASLLC-5CD243
        OS           = (Get-CimInstance Win32_OperatingSystem).Caption
        CPU          = (Get-CimInstance Win32_Processor).Name
        GPU          = (Get-CimInstance Win32_VideoController | Select-Object -First 1).Name
        RAMGB        = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB,2)
        Vendor       = (Get-CimInstance Win32_ComputerSystem).Manufacturer
        Model        = (Get-CimInstance Win32_ComputerSystem).Model
    }
    Write-Host "
Hardware:"
    \ | Format-List
    return \
}
