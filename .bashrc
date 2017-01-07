#!/bin/bash

#####################################################################
# Author      : Zori Babroudi <Zori.Babroudi@RedlineTrading.com>
# Author      : Zori Babroudi
# File        : /home/babroudi/.bashrc
# Last Edited : 06/10/2015
# Description : User specific aliases and functions
#####################################################################

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Change prompt:
#  Simple
#  export PS1='\[$(tput setaf 7)\][\[$(tput setaf 2)\]\u@\h\[$(tput setaf 7)\]:\w]$ \[$(tput sgr0)\]'
#  With Git
export PS1='\[$(tput setaf 7)\][\[$(tput setaf 2)\]\u@\h\[$(tput setaf 7)\]:\w\[\]\[$(tput bold)\]$(__git_ps1 " (%s)")\[$(tput sgr0)\]\[$(tput setaf 7)\]]\$\[$(tput sgr0)\] '
. ~/bin/git-completion.bash
alias 'mountfs'='sudo mount -o rdirplus -t nfs archiver:/home/ /mnt/fs'
alias 'fixapp'='sudo xattr -d -r com.apple.quarantine'
alias 'ebash'='vim ~/.bashrc'
alias 'rbash'='source ~/.bashrc'
alias 'c'='clear'
alias 'q'='sync; exit'
alias 'll'='ls -l'

# Enable bzr bash completion
#eval "`if [[ -e /usr/local/bin/bzr ]]; then bzr bash-completion; fi`"

# Root functions I use:
alias 'ifup'='sudo /sbin/ifup'
alias 'ifdown'='sudo /sbin/ifdown'
alias 'ifconfig'='sudo /sbin/ifconfig'
alias 'vconfig'='sudo /sbin/vconfig'
alias 'ipcs'='sudo ipcs'
alias 'ipcrm'='sudo ipcrm'
alias 'shutdown'='sudo /sbin/shutdown'
alias 'installedrts'='installed rts-inrush'
alias 'cpumask'='cat /sys/devices/system/node/node*/cpumap'
alias 'ssh'='ssh -q -o StrictHostKeyChecking=no -c arcfour,blowfish-cbc,aes128-cbc,3des-cbc'
