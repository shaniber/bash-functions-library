#!/usr/bin/env bash

## Sugar (see man 5 terminfo).
bold=$(tput bold)
reverse=$(tput rev)
strike=$(echo -e "\e[9m")
red=$(tput setaf 1)
orange=$(tput setaf 202)
yellow=$(tput setaf 3)
green=$(tput setaf 2)
cyan=$(tput setaf 6)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
white=$(tput setaf 7)
noColour=$(tput sgr 0)
readonly bold reverse red orange yellow green cyan blue magenta white noColour

## Set to 1 to enable debugging
DEBUG=0

## Useful globals
GIT_PATH=""

## Debugging.
function util::debug() {
  if [[ $DEBUG == 1 ]] ; then
    printf '%s[DEBUG]%b %b \n' "${blue}" "${noColour}" "${1}"
  fi
}

## Generic printing.
function util::print() {
  if [[ ! $SILENT == 1 ]] ; then
    printf "%b" "${1}"
  fi
}

## Warning reporting.
function util::warn() {
  util::debug "A warning has occurred."
  printf "\n%b%b[WARN]%b  %b\n\n" "${yellow}" "${reverse}" "${noColour}" "$1">&2
}

## Error reporting.
function util::error() {
  util::debug "An error has occurred."
  printf "\n%b%b[ERROR]%b %s\n\n" "${red}" "${reverse}" "${noColour}" "${1}" >&2 
}

## Pause for keypress.
function util::pause() {
  util::print "${green}Press any key to continue...${noColour}\n"
  read -n 1 -s -r
}

## Confirm (with prompt).
function util::confirm() {
  local prompt input
  if [ -n "$1" ] ; then
    prompt="$1"
  else 
    prompt="Confirm"
  fi
  prompt="${prompt} [Y/n]: "

  while true ; do
    read -r -p "${prompt}" input
    case $input in
      # Y/y or enter is yes. 
      ""|[Yy]* )
        return 0
        ;;
      # N/n is no
      [Nn]* ) 
        return 1
        ;;
      # Anything else is ignored.
      * ) 
        ;;
    esac
  done
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
  if [ "$(type -t git)" == "file" ] ; then
    GIT_PATH=$(command -v git)
    if ! [ -x "${GIT_PATH}" ] ; then
      util::error "${blue}git${noColour} is on your path, but is not executable.\\nPlease make it executable and rerun this script."
      return 1
    fi
  else
    util::error "${blue}git${noColour} is not available.\\nPlease install it on your path."
    return 1
  fi
  return 0
} 

