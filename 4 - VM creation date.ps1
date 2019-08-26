# VM creation date in vSphere 6.7
$dev | Select *
($dev).ExtensionData
$dev.ExtensionData.Config
$dev.ExtensionData.Config.CreateDate

# Extra credit: View the creation date of all Kyle's VMs using a "calculated property"
Get-VM kr* | Select-Object Name, @{n='CreateDate'; e={$_.ExtensionData.Config.CreateDate}} | Sort-Object CreateDate
