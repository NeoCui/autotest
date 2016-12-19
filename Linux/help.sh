#!/bin/bash

Help(){
	cat << HELP

	The autotest tools are designed to test the functions
	on Linux Operating System.
	The detailed help information of every shell script is
	still under construction.
	Please wait for the updating.

HELP
	exit 0
}

if [ $# -lt 2 ]
then
	Help
else
	echo "Nothing."
fi
#
