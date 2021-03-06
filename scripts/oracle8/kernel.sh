#!/bin/bash -eux

# Now that the system is running atop the updated kernel, we can install the
# development files for the kernel. These files are required to compile the
# virtualization kernel modules later in the provisioning process.
retry dnf --assumeyes install kernel-tools kernel-devel kernel-headers

# Now that the system is running on the updated kernel, we can remove the
# old kernel(s) from the system.
if [[ `rpm -q kernel | wc -l` != 1 ]]; then
  dnf --assumeyes remove $( rpm -q kernel | grep -v `uname -r` )
fi
