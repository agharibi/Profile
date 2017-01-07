# !/bin/bash
############################################################################
# Author      : Zori Babroudi <Zori.Babroudi@RedlineTrading.com>
# Author      : Zori Babroudi
# File        : /home/scripts/os_helper_common.sh
# Last Edited : 01/02/2015
# Description :
# This script populates the following environment variables:
# |--------------|-----------------|
# | Field        | Description     |
# |--------------|-----------------|
# | OS_NAME      | rhel, ubuntu... |
# | OS_MAJOR     | number          |
# | OS_MINOR     | number          |
# | OS_ARCH      | x86_64/i386     |
# | CABS_PRESENT | number          |
# |--------------|-----------------|
#
# Example "$OS_NAME$OS_MAJOR.$OS_MINOR_$OS_ARCH" --> "rhel6.4_x86_64"
############################################################################

CABS_PRESENT=""
function get_cabs_present() {
     if [ -e /sbin/lspci ]; then
          LSPCI=/sbin/lspci
     else
          LSPCI=lspci
     fi

     # if lspci doesn't exist, don't try and use it
     command -v $LSPCI > /dev/null 2>&1 && CABS_PRESENT=`$LSPCI | grep "IBM Axon" | wc -l`
     CABS_PRESENT=${CABS_PRESENT:-0}
}

function is_number() {
     return `echo "$1" | head -c 1 | awk -F"\n" '{print ($0 != $0+0)}'`
}

OS_NAME=""
OS_MAJOR=""
OS_MINOR=""
OS_ARCH=""
function populate_os_strings() {
     local OS_STRING=""
     local OS_VERSION=""
     command -v uname > /dev/null 2>&1 && OS_ARCH=`uname -p`

     # Does lsb exist on this system?
     if command -v lsb_release > /dev/null 2>&1; then
          OS_STRING=`lsb_release -s -d`
     else
          # lsb doesn't exist, try cat /etc/*release
          if [ -f /etc/redhat-release ]; then
               OS_STRING=`cat /etc/redhat-release`
          else
               OS_STRING=$OSTYPE
          fi
     fi

     for str in $OS_STRING; do
          local tmp_str=`echo $str | tr -d '["]'`
          if is_number $tmp_str; then
                OS_VERSION=$tmp_str
          fi
     done

     local tmp_os_version=`echo $OS_VERSION | sed 's/\./ /g'`
     OS_MAJOR=`echo $tmp_os_version | awk '{ print $1 }'`
     OS_MINOR=`echo $tmp_os_version | awk '{ print $2 }'`

     OS_MAJOR=${OS_MAJOR:-"0"}
     OS_MINOR=${OS_MINOR:-"0"}

     local RC=0
     if [[ "$OS_STRING" == *Red* ]]; then
          OS_NAME="rhel"
     elif [[ "$OS_STRING" == *CentOS* ]]; then
          OS_NAME="centos"
     elif [[ "$OS_STRING" == *Fedora* ]]; then
          OS_NAME="fedora"
     elif [[ "$OS_STRING" == *Ubuntu* ]]; then
          OS_NAME="ubuntu"
     elif [[ "$OS_STRING" == *SUSE* ]]; then
          OS_NAME="suse"
     elif [[ "$OS_STRING" == '"System Software"' ]]; then
          OS_NAME="solos"
          OS_MAJOR="13"
          OS_MINOR="0"
     elif [[ "$OS_STRING" == "cygwin" ]]; then
          OS_NAME="cygwin"
          OS_ARCH="i386" #override
     else
          RC=1
     fi

     return $RC
}

populate_os_strings
get_cabs_present
