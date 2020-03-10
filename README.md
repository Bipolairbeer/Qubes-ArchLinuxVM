# Qubes-ArchLinuxVM
An easy way to create your Arch Linux template in QubesOS!
#
#
Step 1:
Update your fedora templateVM

  sudo update && sudo upgrade
#
#
Step 2:
Create a new QubesVM based on a the Fedora template and name this build-archlinux2. Ensure there is at least 15GB of free space in the private storage and it has sys-firewall networking.
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
#
Congratzzzz! You have created your ArchLinuxVM!
