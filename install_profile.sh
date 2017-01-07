#!/bin/bash
set -x
PROF_DIR="${1}"
if [ ! -d "${PROF_DIR}" ]; then
     PROF_DIR=`pwd`;
fi
echo "Using PROF_DIR=${PROF_DIR}"
USER_DIR="${HOME}"
echo "Using USER_DIR=${USER_DIR}"

function remove_old() {
     if [ -h "${USER_DIR}/${1}" ]; then
          #echo "rm ${USER_DIR}/${1}"
          rm "${USER_DIR}/${1}"
     elif [ -d "${USER_DIR}/${1}" ]; then
          #echo "mv ${USER_DIR}/${1} ${USER_DIR}/${1}.old"
          mv "${USER_DIR}/${1}" "${USER_DIR}/${1}.old"
     elif [ -f "${USER_DIR}/${1}" ]; then
          mv "${USER_DIR}/${1}" "${USER_DIR}/${1}.old"
     else
          return
     fi
}

function install_new() {
     if [ ! -e "${PROF_DIR}/${1}" ]; then
          #echo "${PROF_DIR}/${1} doesn't exist"
          return
     else
          remove_old $1
          #echo "ln -s ${PROF_DIR}/${1} ${USER_DIR}/${1}"
          ln -s "${PROF_DIR}/${1}" "${USER_DIR}/${1}"
     fi
}

# Install bashrc
install_new ".bashrc"

# Install vimrc
install_new ".vimrc"

# Install bin
install_new "bin"
