#!/bin/bash
cd
sudo dnf -y install make git pacman gnupg createrepo rpm-build make wget rpmdevtools python3-sh dialog rpm-sign dpkg-dev debootstrap PyYAML devscripts perl-Digest-MD5 perl-Digest-SHA

sudo git clone https://github.com/QubesOS/qubes-secpack.git
sudo chmod -R 777 /home/user/qubes-secpack

cd /home/user/qubes-secpack/
gpg --import qubes-secpack/keys/*/*
gpg --command-fd 0 --edit-key 36879494 <<EOF
fpr
trust
5
y
quit
EOF

cd /home/user/qubes-secpack/canaries/
gpg --verify canary-001-2015.txt.sig.joanna canary-001-2015.txt
gpg --verify canary-001-2015.txt.sig.marmarek canary-001-2015.txt

cd
sudo git clone https://github.com/QubesOS/qubes-builder.git
sudo chmod -R 777 /home/user/qubes-builder

cd /home/user/qubes-builder/
git tag -v `git describe`

cd
cp /home/user/Qubes-ArchLinuxVM/builder.conf /home/user/qubes-builder/builder.conf

cd /home/user/qubes-builder/
make install-deps
make get-sources

make vmm-xen 
make core-admin 
make linux-kernel 
make gui-daemon 
make desktop-linux-kde 
make installer-qubes-os 
make manager 
make linux-dom0-updates
make vmm-xen-vm
make core-vchan-xen-vm
make core-qubesdb-vm
make linux-utils-vm
make core-agent-linux-vm
make gui-common-vm
make gui-agent-linux-vm
make qubes-vm
make template

# Complete the templateVM in dom0: 
# sudo qvm-run --pass-io build-archlinux2 'cat /home/user/qubes-builder/qubes-src/linux-template-builder/rpm/install-templates.sh' > install-templates.sh
# sudo chmod +x install-templates.sh
# sudo ./install-templates.sh


