# Bulk VM tag management

# Creating a new tag category, and a new tag inside it
New-TagCategory -Name cheese -Cardinality Single -EntityType VirtualMachine
New-Tag -Category cheese -Name kyrd
Get-Tag -Name kyrd

# Assign the new tag to all of Kyle's VMs
Get-VM -Name kr* | New-TagAssignment -Tag kyrd
# View VMs with that tag, no pipeline needed
Get-VM -Tag kyrd

# Clean up what we just changed
Remove-Tag kyrd -WhatIf
Remove-Tag kyrd
Remove-TagCategory cheese -Confirm:$false
