#!/bin/bash

# Consts
readonly PATH_LINK=~/bin/ezlogs;

if [[ $1 == "-r" ]]; then # Uninstall
  if [[ -h $PATH_LINK ]]; then
    rm $PATH_LINK;
    echo "ezlogs uninstalled";
  else
    echo "ezlogs already uninstalled";
  fi
else # Install
  # Install requirements
  if [ "$(uname)" == "Darwin" ]; then
    if ! which jq > /dev/null; then
      brew install jq
    fi
    if ! which awk > /dev/null; then
      brew install awk
    fi
  fi
  if [ "$(expr substr "$(uname -s)" 1 5)" == "Linux" ]; then
    if ! which jq > /dev/null; then
      sudo apt update
      sudo apt install jq -y
    fi
    if ! which awk > /dev/null; then
      sudo apt update
      sudo apt install awk -y
    fi
  fi

  # Install symlink to script
  if [[ ! -h $PATH_LINK ]]; then
    ln -s "`pwd`/ezlogs.sh" $PATH_LINK;
    echo "ezlogs successfully installed";
  else
    echo "ezlogs already installed";
  fi
fi
