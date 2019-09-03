# PowerCLI 101

### Blog post: [VMware PowerCLI 101](https://brianbunke.com/blog/2019/09/03/powercli-101)

At VMworld US 2019, [Brian Bunke](https://twitter.com/brianbunke) and [Kyle Ruddy](https://twitter.com/kmruddy) presented session HBI1743BU - "Introduction to PowerCLI." It was intended for those new to PowerShell and/or PowerCLI to see it in action -- hopefully making the command line a little more familiar -- and to provide a permanent "how to get started" example via recorded video and this code repository.

## Demo Files

- [`0 - Setup.ps1`](0%20-%20Setup.ps1)
  - Get/update PowerCLI; connect to vCenter; perform optional one-time setup tasks
- [`1 - Intro.ps1`](1%20-%20Intro.ps1)
  - Discover infrastructure; use the pipeline and a variable; display other object properties
- [`2 - VM snapshots.ps1`](2%20-%20VM%20snapshots.ps1)
  - Discoverability in PowerShell; find and remove old VM snapshots
- [`3 - VM tags.ps1`](3%20-%20VM%20tags.ps1)
  - Tag lifecycle: create, read, update, delete ("CRUD" operations)
- [`4 - VM creation date.ps1`](4%20-%20VM%20creation%20date.ps1)
  - Explore the `ExtensionData` property to view a new vSphere 6.7 feature
- [`5 - Extras.ps1`](5%20-%20Extras.ps1)
  - Some code examples of ideas we introduced but didn't have time to cover during the session:
    - Get VM by MAC address
    - Find VMs with drive media mounted
    - Data manipulation and reporting
    - Compare host DNS/NTP entries
    - Check the "Upgrade Tools on reboot" box on all VMs

---

## Links

### Basic PowerShell and PowerCLI Info

- [PowerShell Overview](https://docs.microsoft.com/en-us/powershell/scripting/overview) [docs.microsoft.com]
  - [Installing PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell)
- [PowerCLI Blog](https://blogs.vmware.com/PowerCLI/)
  - [Installing PowerCLI](https://blogs.vmware.com/PowerCLI/2017/05/powercli-6-5-1-install-walkthrough.html)
- [PowerCLI Feature Requests](https://powercli.ideas.aha.io)

### VMware Hands-on Labs (HOL)

- [VMware vSphere Automation - PowerCLI [HOL-1911-05-SDC]](labs.hol.vmware.com)

### PowerCLI Community

- [VMware PowerCLI Community Forums](https://vmware.com/go/powercli)
- [VMware {code} Slack Community](https://code.vmware.com/web/code/join)
