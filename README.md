# Qubes-ArchLinuxVM
An easy way to create your Arch Linux template in QubesOS!
#
#
Step 1:
Create a new QubesVM based on a the Fedora template and name this build-archlinux2. Ensure there is at least 15GB of free space in the private storage and it has sys-firewall networking.
#
#
Step 2:
Clone this repository in your build-archlinux2 terminal:

  sudo git clone https://github.com/Bipolairbeer/Qubes-ArchLinuxVM.git
#
#
Step 3:
Change the scripts permissions and make it executable:

  sudo chmod -R 777 /home/user/Qubes-ArchLinuxVM
#
#
Step 4:
To run the script make sure that you are in the right directory:
  
  cd /home/user/Qubes-ArchLinuxVM/
#
#
Step 5:
Run the script

  sudo ./archlinux-builder.sh
#
#
#
Congratzzzz! You have created your ArchLinuxVM!
