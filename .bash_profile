#!/bin/bash
# Mac OSX
unamestr=`uname`
if [[ "$unamestr" == "Darwin" ]];then
	source $HOME/.bashrc
	source $HOME/.bash_aliases
    export HOMEBREW_GITHUB_API_TOKEN="926a4042d1dc6f9ce8c9b3cdaf5d7b001c3712ba"
    export PATH=$PATH:/Applications/Appium.app/Contents/Resources/node_modules/appium/bin/
    export ANDROID_HOME=~/src/android-sdk-macosx/
fi
