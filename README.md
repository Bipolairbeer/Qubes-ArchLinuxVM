# Qubes-ArchLinuxVM
An easy way to create your Arch Linux template in QubesOS!
#
#
Step 1:
Create a new QubesVM based on a the Fedora template and name this build-archlinux2. Ensure there is at least 15GB of free space in the private storage and it has sys-firewall networking.
#
#
Step 2:
Update build-archlinux2

  sudo dnf update && sudo dnf upgrade
#
#
Step 3:
Clone this repository in your build-archlinux2 terminal:

  sudo git clone https://github.com/Bipolairbeer/Qubes-ArchLinuxVM.git
#
#
Step 4:
Change the scripts permissions and make it executable:

  sudo chmod -R 777 /home/user/Qubes-ArchLinuxVM
#
#
Step 5:
To run the script make sure that you are in the right directory:
  
  cd /home/user/Qubes-ArchLinuxVM/
#
#
Step 6:
Run the script

  sudo ./archlinux-builder.sh
#
#
Wenn the script finished, open the dom0 terminal and give these three commands:

  sudo qvm-run --pass-io build-archlinux2 'cat /home/user/qubes-builder/qubes-src/linux-template-builder/rpm/install-templates.sh' > install-templates.sh
  
  sudo chmod +x install-templates.sh
  
  sudo ./install-templates.sh
#
#
Congratzzzz! You have now created your ArchLinuxVM!

