### Get VM by MAC address
Get-VM | Get-NetworkAdapter | Where-Object {$_.MacAddress -eq '01:23:45:67:89:ab'} | Select-Object Parent, Name, MacAddress

#region ### Find VMs with drive media mounted

# How can I find media mounted on any VM?
Get-VM | Get-CDDrive | Select-Object Parent, HostDevice, IsoPath

# Extra credit: Eject mounted media (i.e. ISO files) from those drives
# Note that this typically errors out on Linux VMs
Get-VM | Get-CDDrive | Where-Object IsoPath -Like * | Set-CDDrive -NoMedia

#endregion

#region ### Data manipulation and reporting
Get-Datastore

# Adding a "calculated property" to your objects
Get-Datastore |
    Select-Object Name,
                  CapacityGB,
                  FreeSpaceGB,
                  @{n='UsedSpaceGB'; e={$_.CapacityGB - $_.UsedSpaceGB}}

# Sort the datastores, round the numbers, store in new variable $report
# PowerShell can directly access .NET APIs like this Math.Round method
$report = Get-Datastore |
    Sort-Object   Name  |
    Select-Object Name,
                  @{n='CapacityGB';  e={[int]$_.CapacityGB}},
                  @{n='FreeSpaceGB'; e={[math]::Round($_.FreeSpaceGB, 1)}},
                  @{n='UsedSpaceGB'; e={[math]::Round(($_.CapacityGB - $_.UsedSpaceGB), 1)}}

# Save to a local CSV, then open it in your default CSV application
$report | Export-Csv ~\Desktop\datastore.csv -NoTypeInformation
Invoke-Item ~\Desktop\datastore.csv

#endregion

### Compare host DNS/NTP entries
# NtpServers uses a calculated property that calls a second command inside
Get-VMHost | Get-VMHostNetwork | Select-Object HostName, DnsAddress, @{n='NtpServers'; e={Get-VMHostNtpServer -VMHost "$($_.HostName)*"}}

### All VMs should check for Tools upgrade on reboot
Get-VM | Select Name, @{n='ToolsUpgradePolicy'; e={$_.ExtensionData.Config.Tools.ToolsUpgradePolicy}}
# https://blogs.vmware.com/vsphere/2018/09/automating-upgrade-of-vmware-tools-and-vmware-compatibility.html
Get-VM |
Where-Object {$_.ExtensionData.Config.Tools.ToolsUpgradePolicy -eq 'manual'} |
ForEach-Object {
    $VMConfig = Get-View -VIObject $_.Name
    $vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
    $vmConfigSpec.Tools = New-Object VMware.Vim.ToolsConfigInfo
    $vmConfigSpec.Tools.ToolsUpgradePolicy = "UpgradeAtPowerCycle"
    $VMConfig.ReconfigVM($vmConfigSpec)
}
