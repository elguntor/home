#!/bin/bash
# Mac OSX
unamestr=`uname`
if [[ "$unamestr" == "Darwin" ]];then
	source .bashrc
	source .bash_aliases
fi
