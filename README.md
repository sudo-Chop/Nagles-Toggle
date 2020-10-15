# Nagles-Toggle
PowerShell Script to Disable/Enable Nagle's Algorithm for a NIC
[Nagles Algorithm](https://en.wikipedia.org/wiki/Nagle%27s_algorithm)

## Description
Creates and sets DWORD values under primary NIC's registry depending on whether you want Nagle's Algorithm to be enabled or disabled.

### Why Disable?
By default Windows 10 has Nagle's Agorithm enabled. Disabling the algorithm helps remove latency issue which can benefit applications which rely on large amount of data traffic (i.e. Online Computer Games).

#### Warning
Disabling Nagle's Algorithm can cause network congestion which can intefere with other connected devices on your network.


