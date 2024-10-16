﻿# OpenPorts

This tool allows you to find the open ports that the firewall permits. It is very helpful for identifying the firewall rules and understanding which services you are either allowed or blocked from using.

After identifying the open ports, you will have a clear understanding of what you can do from within the network. You can use the open ports, for example, to connect to a VPN and create a tunnel to bypass network restrictions and access blocked services. In a penetration testing context, you can use information about the open ports to perform specific scans and identify vulnerable points. Also, you can use these ports to open your own service on the network and allow other users to access it.

## Requirements

You don't need any special prerequisites or pre-installed packages, just a Debian or Ubuntu system.

To use it, clone this repo and run this command to start using it :

```bash
chmod +x openports.sh
```

Then, run the script with the following command:

```bash
./openports.sh
```

![first screen](/media/openports.png)

Now, there are several options you can choose from. The script already offers scanning for the three main ranges of ports:

1) (1 - 1023) Well-Known Ports
2) (1024 - 49151) Registered Ports
(49152 - 65535) Dynamic/Private Ports
3) This allows you to scan ranges separately and divide the scanning process, so it won’t take too long.

If you have a custom range you want to scan, choose option 4.

If you want to scan a single port, you can select option 5.

This is an example of selecting the first option :

![first screen](/media/result%201.png)

After choosing an option, the script will show the estimated time you need to wait before scanning all the ports in the selected range. It also shows the results of the scanning in real-time. Once the scan is complete, you will find a file called `ports.txt` in the same folder as the script, containing the final results.

![first screen](/media/file.png)

These are examples for selecting other options : 

![first screen](/media/single%20mode.png)

![first screen](/media/custom%20range.png)

The accuracy of this tool depends on the internet speed of your network. If you have any doubts about the results, you can use it as many times as you like.

Enjoooy !!
