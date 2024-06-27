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

       cd IMCHANGER

## Usage
   To start the tool and change the network settings, run the following command:
     
       bash imchanger.sh
     
   To revert the network settings to the original state, run:
     
       bash imchanger.sh revert

  
## Contributing
   Feel free to contribute to this project by submitting issues or pull requests. Any improvements or suggestions are welcome.

   
## License
   This project is licensed under the MIT License. See the   <details>
<summary><strong> LICENSE file for details. </strong></summary>

MIT License

Copyright (c) 2024

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

1. The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

2. The Software shall be used for Good, not Evil.

3. The Software shall not be used to harm, defame, or negatively impact any person,
organization, or community.

4. The Software shall be used in compliance with all applicable laws and regulations,
including those pertaining to data protection and privacy.

5. Users of the Software shall strive to maintain and improve the quality and security
of the Software, and report any issues or vulnerabilities to the maintainers.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

</details>

