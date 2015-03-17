#!/usr/bin/expect -f
set ip [lindex $argv 0]
set timeout 20


set f [open "machineslist.txt"]
set hosts [split [read $f] "\n"]
close $f

foreach host $hosts {
spawn telnet $host
expect "Username:"
send "USERNAME\r"
expect "Password:"
send "USERPASSWORD\r"
expect "\>"
send "ena\r"
expect "Password:"
send "ENAPASSWORD\r"
send "conf t\r"
send "COMMAND1\r"
send "COMMAND2\r"
send "COMMAND3\r"
send "exit\r"
send "write\r"
send "quit\r"
interact
sleep 2
}
