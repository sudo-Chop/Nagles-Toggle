# Nagles-Toggle
PowerShell Script to Disable/Enable Nagle's Algorithm for a NIC
[Nagles Algorithm](https://en.wikipedia.org/wiki/Nagle%27s_algorithm)

## Description
Creates and sets DWORD values under primary NIC's registry depending on whether you want Nagle's Algorithm to be enabled or disabled.

### Why Disable?
By default Windows 10 has Nagle's Agorithm enabled. Disabling the algorithm helps remove latency issue which can benefit applications which rely on large amount of data traffic (i.e. Online Computer Games).

#### *Warning*
Disabling Nagle's Algorithm can cause network congestion which can intefere with other connected devices on your network. I would suggest enabling Nagle's Algorithm when you are finished.

## Setup
You will need to find the NIC device ID for your system and edit the scripts with this ID under 'YOUR NIC DEVICE ID'.
  1. Open the Registry Editor in Windows
  2. Enter or follow the path HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces
  3. Find the NIC device ID for NIC that contains your IP Address Example: {65b5c830-a4d8-4bc9-a88e-c2eec895e328}
  4. Replace 'YOUR NIC DEVICE ID' in scripts with the alphanumerical value found in Registry Editor.
  
Highly suggest creating a shortcut on desktop to easily run scripts. This can be done by a quick Google search :).
  
## Run Scripts
You may need to change your Execution Policy so that your are able to run PowerShell scripts. To change Execution Policy:
  1. Right click Windows Powershell prompt, Run as Administrator, then enter the command: `Set-ExecutionPolicy RemoteSigned`.
  2. You will then be prompted if you want to change the execution policy. Proceed by entering `A` for 'Yes to All'. Once complete you will be able to run the scripts provided.

Run Script.

For security purposes you can revert back to default Execution Policy by running the command: `Set-ExecutionPolicy Restricted`

### Example Output
``` PowerShell
PS C:\Users\Admin\scriptz> .\disable-nagles-algorithm.ps1
>>>> Nagles Algorithm Disable <<<<
TcpAckFrequency:'1'
TCPNoDelay:'1'


    Hive: HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces


Name                           Property
----                           --------
{65b5c830-a4d8-4bc9-a88e-c2eec EnableDHCP           : 0
895e328}                       IPAddress            : {10.10.10.10}
                               SubnetMask           : {255.255.255.0}
                               DefaultGateway       : {10.10.10.1}
                               DefaultGatewayMetric : {0}
                               TcpAckFrequency      : 1
                               Domain               :
                               NameServer           : 1.1.1.1,1.0.0.1
                               RegistrationEnabled  : 1
                               RegisterAdapterName  : 0
                               TCPNoDelay           : 1
```

