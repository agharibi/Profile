# !/bin/bash
############################################################################
# Author      : Zori Babroudi <Zori.Babroudi@RedlineTrading.com>
# Author      : Zori Babroudi
# File        : /home/scripts/os_helper_functions.sh
# Last Edited : 08/14/2014
# Description : Helper functions for installing / uninstalling applications
############################################################################

function os_functions() {
     echo "OS Helper functions"
     echo "get_os -- prints out the OS and number of cabs."
     echo "install -- will do rpm -i or dpkg depending on OS. Ex: install *.rpm."
     echo "installed -- will tell you if something is installed or list all installed packages. Ex: isntalled rts-inrush or installed."
     echo "uninstall -- will do rpm -ev or dpkg equivilent depending on OS. Ex: uninstall rts-inrush."
     echo "service -- will do sudo service command. It uses the absolute path depending on the OS."
}

function get_os() {
     . /home/scripts/os_helper_common.sh 
     echo $OS_NAME"_"$OS_MAJOR"."$OS_MINOR
     echo "Number of cabs = "$CABS_PRESENT
}

function install() {
     . /home/scripts/os_helper_common.sh 
     if [[ "$OS_NAME" == *ubuntu* ]]; then
          sudo dpkg -i $@
     else
          sudo rpm -ifv $@
     fi
}

function installed() {
     # Optimization for rhel
     command -v rpm --version > /dev/null 2>&1 && ! [[ -z $1 ]] && sudo rpm -q $1 && return 0

     . /home/scripts/os_helper_common.sh 
     if [[ "$OS_NAME" == *ubuntu* ]]; then
          if [[ "$1" != "" ]]; then
               sudo dpkg -l | grep $1
          else
               sudo dpkg -l
          fi
     else
          [[ -n "$1" ]] && sudo rpm -q $1 || sudo rpm -qa
     fi
}

function uninstall() {
     . /home/scripts/os_helper_common.sh 
     if [[ "$OS_NAME" == *ubuntu* ]]; then
          sudo dpkg -r $@
     else
          sudo rpm -ev $@
     fi
}

function service() {
     . /home/scripts/os_helper_common.sh 
     if [[ "$OS_NAME" == *ubuntu* ]]; then
          sudo /usr/sbin/service $@
     else
          sudo /sbin/service $@
     fi
}
