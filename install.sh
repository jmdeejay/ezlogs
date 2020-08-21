#!/bin/bash

# Consts
readonly PATH_LINK=~/bin/ezlogs;

function installRequirements {
  [[ ! $(which jq) ]] && installJQ=true || installJQ=false;
  [[ ! $(which awk) ]] && installAwk=true || installAwk=false;

  if ($installJQ || $installAwk); then
    echo "Installing requirements";
    if [[ "$(uname)" == "Darwin" ]]; then
      if $installJQ; then
        echo "Installing jq";
        brew install jq;
      fi
      if $installAwk; then
        echo "Installing awk";
        brew install awk;
      fi
    fi
    if [[ "$(expr substr "$(uname -s)" 1 5)" == "Linux" ]]; then
      sudo apt update;
      if $installJQ; then
        echo "Installing jq";
        sudo apt install jq -y;
      fi
      if $installAwk; then
        echo "Installing awk";
        sudo apt install awk -y;
      fi
    fi
  fi
}

function Install {
  # Install requirements
  installRequirements;

  # Install symlink to script
  if [[ ! -h $PATH_LINK ]]; then
    ln -s "`pwd`/ezlogs.sh" $PATH_LINK;
    echo "ezlogs successfully installed";
  else
    echo "ezlogs already installed";
  fi
}

function Uninstall {
  if [[ -h $PATH_LINK ]]; then
    rm $PATH_LINK;
    echo "ezlogs uninstalled";
  else
    echo "ezlogs already uninstalled";
  fi
}

if [[ $1 == "-r" ]]; then
  Uninstall
else
  Install
fi
