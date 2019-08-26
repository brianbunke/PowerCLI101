# Bulk VM tag management

# Creating a new tag category, and a new tag inside it
New-TagCategory -Name dev -Cardinality Single -EntityType VirtualMachine
New-Tag -Category prod -Name dev
Get-Tag -Name prod

# Assign the new tag to all of Kyle's VMs
Get-VM -Name kr* | New-TagAssignment -Tag prod
# View VMs with that tag, no pipeline needed
Get-VM -Tag prod

# Clean up what we just changed
Remove-Tag prod -WhatIf
Remove-Tag prod
Remove-TagCategory dev -Confirm:$false
