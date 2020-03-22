#!/bin/bash
sudo chmod -R 777 /home/user/Qubes-ArchLinuxVM
sudo dnf -y install make git pacman gnupg createrepo rpm-build make wget rpmdevtools python3-sh dialog rpm-sign dpkg-dev debootstrap PyYAML devscripts perl-Digest-MD5 perl-Digest-SHA nano qemu-utils unzip

sudo git clone https://github.com/QubesOS/qubes-secpack.git /home/user/qubes-secpack
sudo chmod -R 777 /home/user/qubes-secpack

gpg --import qubes-secpack/keys/*/*
gpg --command-fd 0 --edit-key 36879494 <<EOF
fpr
trust
5
y
quit
EOF

cd /home/user/qubes-secpack/
$ git tag -v `git describe`

cd /home/user/qubes-secpack/canaries/
gpg --verify canary-001-2015.txt.sig.joanna canary-001-2015.txt
gpg --verify canary-001-2015.txt.sig.marmarek canary-001-2015.txt

cd
sudo git clone https://github.com/QubesOS/qubes-builder.git ~/qubes-builder
sudo chmod -R 777 /home/user/qubes-builder

cd /home/user/qubes-builder/
git tag -v `git describe`

cd
sudo cp /home/user/Qubes-ArchLinuxVM/builder.conf /home/user/qubes-builder/builder.conf

cd /home/user/qubes-builder/
make install-deps
make get-sources

make core-admin
make core-agent-linux
make core-qubesdb
make core-qrexec
make core-vchan
make desktop-linux-kde
make desktop-linux-awesome
make gui-agent-linux
make gui-common
make gui-daemon
make installer-qubes-os
make linux-dom0-updates
make linux-kernel
make linux-utils
make manager 
make vmm-xen

make qubes-vm
make template

# Complete the templateVM in dom0: 
# sudo qvm-run --pass-io build-archlinux2 'cat /home/user/qubes-builder/qubes-src/linux-template-builder/rpm/install-templates.sh' > install-templates.sh
# sudo chmod +x install-templates.sh
# sudo ./install-templates.sh

