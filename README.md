# scripts
Various scripts

- cbce.sh
Cisco Bulk Command Executor.

This shell script requires 'expect' to be installed (that is 'apt-get install expect' on Debian based systems). It executes commands on Cisco
machines whose IPs are written in a file called 'machineslist.txt' (that you have to create) located in the cbce.sh's directory . Every host 
must be written on its own line. Beside adding more commands, please customise USERNAME, USERPASSWORD, ENAPASSWORD, COMMAND<1|2|3> inside 
cbce.sh.
