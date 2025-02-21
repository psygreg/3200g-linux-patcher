# 3200g-linux-patcher
A patcher for a widespread Ryzen 3 3200G AMDGPU crashing issue.

## Requirements
Currently only supports systems using GRUB and rEFInd as bootloaders.

###Why not systemd-boot?
The name of systemd-boot's configuration file changes depending on your distro. It's not feasible to automate the patch for it.

## Usage
Download, mark as executable and run as a program.
Or, on terminal:\
`git clone https://github.com/psygreg/3200g-linux-patcher.git`\
`cd 3200g-linux-patcher`\
`chmod +x 3200g-linux-patcher.sh`\
`./3200g-linux-patcher.sh`\
Reboot to apply.
