#!/bin/bash
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
alias 'ebash'='vim ~/.bash_profile'
alias 'rbash'='source ~/.bash_profile'
alias 'c'='clear'
alias 'q'='sync; exit'
alias 'l'='ls'
alias 'll'='ls -la'
alias 'la'='ls -a'

# Enable bzr bash completion
#eval "`if [[ -e /usr/local/bin/bzr ]]; then bzr bash-completion; fi`"

# Root functions I use:
alias 'please'='sudo'
alias 'ifup'='sudo /sbin/ifup'
alias 'ifdown'='sudo /sbin/ifdown'
alias 'ifconfig'='sudo /sbin/ifconfig'
alias 'vconfig'='sudo /sbin/vconfig'
alias 'ipcs'='sudo ipcs'
alias 'ipcrm'='sudo ipcrm'
alias 'shutdown'='sudo /sbin/shutdown'
alias 'installedrts'='installed rts-inrush'
alias 'cpumask'='cat /sys/devices/system/node/node*/cpumap'
alias 'mvim'='mvim -v'
alias 'vim'='nvim'
alias 'vm'='ssh agharibi@192.168.64.2'
alias 'purdue'='ssh agharibi@data.cs.purdue.edu'
alias 'pucrew'='ssh pucrew@maven.itap.purdue.edu'
