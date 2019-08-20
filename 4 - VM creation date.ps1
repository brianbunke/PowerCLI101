# VM creation date in vSphere 6.7
$kyrd | Select *
($kyrd).ExtensionData
$kyrd.ExtensionData.Config
$kyrd.ExtensionData.Config.CreateDate

# Bonus: View the creation date of all Kyle's VMs using a "calculated property"
Get-VM kr* | Select-Object Name, @{n='CreateDate'; e={$_.ExtensionData.Config.CreateDate}} | Sort-Object CreateDate
