#!/usr/bin/env bash

# shellcheck disable=SC2046,SC2154,SC2304,SC1091,SC2059,SC2034

## 
extract() {
  escaped_string=${1@Q}
  echo "${escaped_string:2:-1}"
}

failed_tests=0
x=18
source $( dirname "${BASH_SOURCE[0]}" )/bash-functions-lib.sh

## Test each function.

echo
echo "-=-= COLOUR TESTS =-=-"
### BOLD test
echo -n "» [TEST 01/${x}]                  BOLD: "
if [ ! "$(extract "$bold")" == "\E[1m" ] ; then 
  echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else
  echo "$(tput setaf 2) PASSED"
fi
tput sgr 0 

### REVERSE test
echo -n "» [TEST 02/${x}]               REVERSE: "
if [ ! "$(extract "$reverse")" == "\E[7m" ] ; then 
  echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else
  echo "$(tput setaf 2) PASSED"
fi
tput sgr 0

### RED test
echo -n "» [TEST 03/${x}]                   RED: "
if [ ! "$(extract "$red")" == "\E[31m" ] ; then 
  echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else
  echo "$(tput setaf 2) PASSED"
fi
tput sgr 0

### ORANGE test
echo -n "» [TEST 04/${x}]                ORANGE: "
if [ ! "$(extract "$orange")" == "\E[38;5;202m" ] ; then 
  echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else
  echo "$(tput setaf 2) PASSED"
fi
tput sgr 0

### YELLOW test
echo -n "» [TEST 05/${x}]                YELLOW: "
if [ ! "$(extract "$yellow")" == "\E[33m" ] ; then 
  echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else
  echo "$(tput setaf 2) PASSED"
fi
tput sgr 0

### GREEN test
echo -n "» [TEST 06/${x}]                 GREEN: "
if [ ! "$(extract "$green")" == "\E[32m" ] ; then 
  echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else
  echo "$(tput setaf 2) PASSED"
fi
tput sgr 0

### CYAN test
echo -n "» [TEST 07/${x}]                  CYAN: "
if [ ! "$(extract "$cyan")" == "\E[36m" ] ; then 
  echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else
  echo "$(tput setaf 2) PASSED"
fi
tput sgr 0

### BLUE test
echo -n "» [TEST 08/${x}]                  BLUE: "
if [ ! "$(extract "$blue")" == "\E[34m" ] ; then 
  echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else
  echo "$(tput setaf 2) PASSED"
fi
tput sgr 0

### MAGENTA test
echo -n "» [TEST 09/${x}]               MAGENTA: "
if [ ! "$(extract "$magenta")" == "\E[35m" ] ; then 
  echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else
  echo "$(tput setaf 2) PASSED"
fi
tput sgr 0

### WHITE test
echo -n "» [TEST 10/${x}]                 WHITE: "
if [ ! "$(extract "$white")" == "\E[37m" ] ; then 
  echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else
  echo "$(tput setaf 2) PASSED"
fi
tput sgr 0

## NOCOLOUR test
echo -n "» [TEST 11/${x}]              NOCOLOUR: "
if ! [ "$(extract "${noColour}")" == "\E(B\E[0m" ] ; then
  echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else 
  echo "$(tput setaf 2) PASSED"
fi
tput sgr 0

echo
echo "-=-= FUNCTION TESTS =-=-"

## DEBUG test
DEBUG=1
echo -n "» [TEST 12/${x}]        DEBUG FUNCTION: "
if ! [ "$(extract $(util::debug ""))" == "\E[34m[DEBUG]\E(B\E[0m" ] ; then
  echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else 
  echo "$(tput setaf 2) PASSED"
fi
DEBUG=0
tput sgr 0

## PRINT test
echo -n "» [TEST 13/${x}]        PRINT FUNCTION: "
if ! [ "$(util::print "Test")"  == "Test" ] ; then 
    echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else
    echo "$(tput setaf 2) PASSED"
fi
tput sgr 0

## WARN test
echo -n "» [TEST 14/${x}]         WARN FUNCTION: "
if ! [ "$(extract "$(util::warn "" 2>&1)")" == "\n\E[33m\E[7m[WARN]\E(B\E[0m  " ] ; then
  echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else 
  echo "$(tput setaf 2) PASSED"
fi
tput sgr 0

## ERROR test
echo -n "» [TEST 15/${x}]        ERROR FUNCTION: "
if ! [ "$(extract "$(util::error "" 2>&1)")" == "\n\E[31m\E[7m[ERROR]\E(B\E[0m " ] ; then
  echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else 
  echo "$(tput setaf 2) PASSED"
fi
tput sgr 0

## PAUSE test
echo -n "» [TEST 15/${x}]        PAUSE FUNCTION: "
if ! [ "$(extract "$(echo "z" | util::pause)")" == "\E[32mPress any key to continue...\E(B\E[0m" ] ; then 
  echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else 
  echo "$(tput setaf 2) PASSED"
fi
tput sgr 0

## CONFIRM test (Should really test Y,N, and enter)
echo -n "» [TEST 16/${x}]      CONFIRM FUNCTION: "
if ! echo | util::confirm "Yes please" 2>/dev/null ; then 
  echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else 
  echo "$(tput setaf 2) PASSED"
fi
tput sgr 0

## REQUIREMENTS test
echo -n "» [TEST 17/${x}] REQUIREMENTS FUNCTION: "
if ! util::confirm_requirements ; then
  echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else 
  echo "$(tput setaf 2) PASSED"
fi
tput sgr 0

## USAGE test
echo -n "» [TEST 18/${x}]        USAGE FUNCTION: "
if ! [[ "$(util::usage)" =~ "Usage:" ]] ; then
  echo "$(tput setaf 1) FAILED"
  ((failed_tests=failed_tests+1))
else 
  echo "$(tput setaf 2) PASSED"
fi
tput sgr 0

echo 

if [ $failed_tests -gt 0 ] ; then 
  echo -E "» Failed Tests: ${failed_tests}/${x}"
  echo "  Please address the issues, then re-run the tests."
  exit 1
else 
  echo "» ${x}/${x} tests passed!"
  exit 0
fi

