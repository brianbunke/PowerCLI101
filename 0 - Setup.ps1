# Install all PowerCLI modules
Install-Module -Name VMware.PowerCLI -Verbose

# Update all PowerCLI modules
Update-Module -Name VMware.PowerCLI -Verbose

# View a list of all installed VMware modules
Get-Module VMware* -ListAvailable
