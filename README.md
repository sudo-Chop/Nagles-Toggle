# Nagles-Toggle
PowerShell Script to Disable/Enable Nagle's Algorithm for a NIC
[Nagles Algorithm](https://en.wikipedia.org/wiki/Nagle%27s_algorithm)

## Description
Creates and sets DWORD values under primary NIC's registry depending on whether you want Nagle's Algorithm to be enabled or disabled.

### Why Disable?
By default Windows 10 has Nagle's Agorithm enabled. Disabling the algorithm helps remove latency issue which can benefit applications which rely on large amount of data traffic (i.e. Online Computer Games).

#### Warning
Disabling Nagle's Algorithm can cause network congestion which can intefere with other connected devices on your network. I would suggest enabling Nagle's Algorithm when you are finished.

## Setup
You will need to find the NIC device ID for your system and edit the scripts with this ID under 'YOUR NIC DEVICE ID'.
You may also need to change your Execution Policy so that your are able to run PowerShell scripts. You can do so by right clicking Windows Powershell prompt, Run as Administrator, then entering the command:
`Set-ExecutionPolicy RemoteSigned`
You will then be prompted if you want to change the execution policy and you can proceed by entering `A` for 'Yes to All'


