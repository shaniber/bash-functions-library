#!/usr/bin/env bash

source $( dirname "${BASH_SOURCE[0]}" )/bash-functions-lib.sh

## Test each function.

echo "### Test bold text."
printf "» ${bold}This is bold text.${noColour}\n"

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

echo "### Test text formatting reset."
printf "${bold}\033[31mR \033[40mA \033[33mI \033[32mN \033[36mB \033[34mO \033[35mW ${noColour}\n» This is text reset to default.\n"

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

echo "### Test reverse text."
printf "» ${reverse}This is reverse text.${noColour}\n"

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

echo "### Test red text."
printf "» ${red}This is red text.${noColour}\n"

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

echo "### Test green text."
printf "» ${green}This is green text.${noColour}\n"

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

echo "### Test yellow text."
printf "» ${yellow}This is yellow text.${noColour}\n"

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

echo "### Test blue text."
printf "» ${blue}This is blue text.${noColour}\n"

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

echo "### Test magenta text."
printf "» ${magenta}This is magenta text.${noColour}\n"

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

echo "### Test cyan text."
printf "» ${cyan}This is cyan text.${noColour}\n"

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

echo "### Test orange text."
printf "» ${orange}This is orange text.${noColour}\n"

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

echo "### Test white text."
printf "» ${white}This is white text.${noColour}\n"

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

echo "### Test debug function."
DEBUG=1
util::debug "» This is a debugging statement."
DEBUG=0

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

echo "### Test print function."
util::print "» This is a printed statement.\n"

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

echo "### Test error function."
util::error "» This is an error statement."

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

echo "### Test pause function."
util::pause

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

echo "### Test confirm funciton."
util::confirm "» Press Y, n, or enter"

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

echo "### Test usage function."
util::usage

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

echo "### Test confirm_requirements function."
if util::confirm_requirements ; then
    echo "GIT_PATH is ${GIT_PATH}"
fi

echo
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo

