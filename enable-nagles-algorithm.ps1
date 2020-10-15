#These values will need to be updated
$HKLM_REG = 'hklm:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces'
$NIC = '{YOUR NIC DEVICE ID}'

$FULL_PATH = Join-Path -Path $HKLM_REG -ChildPath $NIC
$NIC_INFO = Get-Childitem -path $HKLM_REG -recurse -ErrorAction SilentlyContinue | Where-Object {$_.Name -match $NIC}

#Creates the DWORD Registry Keys nessary to disable algorithm
Set-Itemproperty -path $FULL_PATH -Name 'TcpAckFrequency' -value '0'    
Set-Itemproperty -path $FULL_PATH -Name 'TCPNoDelay'-value '0'

#Prints NIC Registry info to verify changes   
Write-Host ">>>> Nagles Algorithm Enabled <<<<" -ForegroundColor Red
Write-Host "TcpAckFrequency:'0'" -ForegroundColor Red
Write-Host "TCPNoDelay:'0'" -ForegroundColor Red
$NIC_INFO
