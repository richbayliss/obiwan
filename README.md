Open Broadband WAN Gateway - obiwan
======
This project provides the package contents to build the obiwan package. This package will convert an Ubuntu Server install into a Broadband RAS server, designed for testing CPE.

The aims of the project are as follows:
Simple Installation
Full service stack (PPP & IP connectectivity, Firewall etc)
Close real-world emulation (use RADIUS for PPP attributes etc)

Building
=====
The source tree will provide the folder structure to perform a package build on Ubuntu.

/home
/home/obiwan
/home/obiwan/etc
/home/obiwan/DEBIAN

in /home run "dpkg --build obiwan" to build the package. Install as "dpkg -i obiwan.deb". If you face dependancy issues run "apt-get install -f".
