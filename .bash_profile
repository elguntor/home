#!/bin/bash
# Mac OSX
unamestr=`uname`
if [[ "$unamestr" == "Darwin" ]];then
	source $HOME/.bashrc
	source $HOME/.bash_aliases
fi
