# Install all PowerCLI modules
Install-Module -Name VMware.PowerCLI -Verbose

# Update all installed PowerCLI modules
Update-Module -Name VMware.PowerCLI -Verbose

# View a list of all installed VMware modules
Get-Module VMware* -ListAvailable

# Connect to your vCenter server (be prompted for username/password)
Connect-VIServer -Server vcenter.contoso.test

# Did you see an error about an invalid vCenter certificate?
Get-PowerCLIConfiguration
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -DefaultVIServerMode Multiple -ParticipateInCeip $true
    # Ignore invalid certificates
    # Allow connecting to multiple servers at the same time ("Single" would prevent simultaneous connections)
    # CEIP sends anonymized usage data to the PowerCLI team ($false would opt out)

# "Automatic variables" specific to PowerCLI
# List all vCenter servers I'm currently connected to
$global:DefaultVIServers
# List the most recent vCenter server I connected to
$global:DefaultVIServer
