#!/usr/bin/env bash

## Sugar.
readonly bold=$(tput bold)
readonly reverse=$(tput rev)
readonly red=$(tput setaf 1)
readonly green=$(tput setaf 2)
readonly yellow=$(tput setaf 3)
readonly blue=$(tput setaf 4)
readonly magenta=$(tput setaf 5)
readonly cyan=$(tput setaf 6)
readonly orange=$(tput setaf 202)
readonly white=$(tput setaf 7)
readonly noColour=$(tput sgr 0)

## Set to 1 to enable debugging
DEBUG=0

## Useful globals
GIT_PATH=""

## Debugging.
function util::debug() {
  if [[ $DEBUG == 1 ]] ; then
    printf "${blue}[DEBUG]${noColour} ${1}\n"
  fi
}

## Generic printing.
function util::print() {
  if [[ ! $SILENT == 1 ]] ; then
    printf "${1}"
  fi
}

## Error reporting.
function util::error() {
  util::debug "An error has occurred."
  printf "\n${red}${reverse}[ERROR]${noColour} $1\n\n" >&2
}

## Pause for keypress.
function util::pause() {
  util::print "${green}Press any key to continue...${noColour}\n"
  read -n 1 -s -r
}

## Usage.
function util::usage() {
  util::print "Usage: ./SCRIPT-NAME.sh \n\n"
  util::print "  Change this output to match that of your script.\n"
}

## Check for script tool requirements.
### NOTE: This does not check for the existance of aliases.
###       It probably should.
function util::confirm_requirements() {
  ### Check for, for example, the git command. 
  if [ $(type -t git) == "file" ] ; then
    GIT_PATH=$(command -v git)
    if ! [ -x ${GIT_PATH} ] ; then
      util::error "${blue}git${noColour} is on your path, but is not executable.\\nPlease make it executable and rerun this script."
      exit 1
    fi
  else
    util::error "${blue}git${nocolour} is not available.\\nPlease install it on your path."
  fi
} 

