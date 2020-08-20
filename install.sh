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
else #Install
    if [[ ! -h $PATH_LINK ]]; then
        ln -s "`pwd`/ezlogs.sh" $PATH_LINK;
        echo "ezlogs successfully installed";
    else
        echo "ezlogs already installed";
    fi
fi
