#!/bin/bash
set -e
echo "Finalize LFS configuration.."

# LFS version file
echo 13.1 > /etc/lfs-release

# Remove shell by tools and set bash as default
rm -v /bin/sh
ln -s /bin/bash /bin/sh

# LSB version file
cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE="13.1"
DISTRIB_CODENAME="EvilFreelancer"
DISTRIB_DESCRIPTION="Linux From Scratch"
EOF

# add login logo
cat > /etc/issue << "EOF"
Linux From Scratch \n \l
EOF
