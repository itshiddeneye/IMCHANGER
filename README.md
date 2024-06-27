# IMCHANGER

IMCHANGER is a bash script tool designed to enhance network anonymity by periodically changing the MAC and IP addresses of a specified network interface. It ensures that the necessary tools are installed, displays a large banner, changes the MAC and IP addresses, and can revert to the original settings. The tool runs in a loop, changing the network settings every 30 seconds for 30 minutes.

## Features

- ✅ Checks and installs necessary tools (`macchanger`, `ifconfig`, `dhclient`, `figlet`).
- 🎨 Displays a large ASCII art banner.
- 🔀 Changes the MAC address to a random one from a known vendor.
- 🌐 Changes the IP address by releasing and renewing it.
- 🛠 Reverts to the original MAC and IP address.
- 🔄 Runs in a loop for 30 minutes, changing settings every 30 seconds.

## Installation

1. Ensure you have a Unix-based system with bash installed.
2. Clone the repository using the command:
   ```sh
       git clone https://github.com/itshiddeneye/IMCHANGER.git


3. Navigate to the cloned directory:

       $ cd IMCHANGER

  Usage :
     To start the tool and change the network settings, run the following command:
  
      $ bash imchanger.sh
  
     To revert the network settings to the original state, run:
  
      $ bash imchanger.sh revert
  
  Contributing
      Feel free to contribute to this project by submitting issues or pull requests. Any improvements or suggestions are welcome.
      
  License
      This project is licensed under the MIT License. See the LICENSE file for details.
