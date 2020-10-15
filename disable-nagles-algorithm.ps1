#These values will need to be updated
$HKLM_REG = 'hklm:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces'
$NIC = '{YOUR NIC DEVICE ID}'

$FULL_PATH = Join-Path -Path $HKLM_REG -ChildPath $NIC
$NIC_INFO = Get-Childitem -path $HKLM_REG -recurse -ErrorAction SilentlyContinue | Where-Object {$_.Name -match $NIC}

#Creates the DWORD Registry Keys nessary to disable algorithm
Set-Itemproperty -path $FULL_PATH -Name 'TcpAckFrequency' -value '1' -Type "Dword"    
Set-Itemproperty -path $FULL_PATH -Name 'TCPNoDelay'-value '1' -Type "Dword"

#Prints NIC Registry info to verify changes   
Write-Host ">>>> Nagles Algorithm Disable <<<<" -ForegroundColor Green
Write-Host "TcpAckFrequency:'1'" -ForegroundColor Green
Write-Host "TCPNoDelay:'1'" -ForegroundColor Green
$NIC_INFO
