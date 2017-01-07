#!/usr/bin/expect

set username "babroudi\r"
set password1 "Dua5Rif\r"
set password2 "push\r"
set config "/home/babroudi/.openvpn/client.ovpn"

spawn openvpn --script-security 2 --config $config
expect "Enter Auth Username:"
send $username
expect "Enter Auth Password:"
send $password1
expect "Response:"
send $password2
interact
