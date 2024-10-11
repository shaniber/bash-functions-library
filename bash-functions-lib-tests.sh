#!/usr/bin/env bash

function extract() {
  string_to_be_extracted=$1
  escaped_string=${string_to_be_extracted@Q}
  echo "${escaped_string:2:-1}"
}

function increment_test_counter() {
  ((count=count+1))
}

function increment_failed_tests_counter() {
  ((failed_tests=failed_tests+1))
}

WIDTH=40
TOTAL_TESTS=$(grep "^increment_test_counter" bash-functions-lib-tests.sh | wc -l | xargs)
failed_tests=0
count=0

source "$( dirname "${BASH_SOURCE[0]}" )/bash-functions-lib.sh"

## Test each function.

echo
echo "-=-= FORMAT TESTS =-=-"

### JUSTIFY tests
increment_test_counter
printf "» [TEST%+3s/%s]%${WIDTH}s " $count $TOTAL_TESTS "RIGHT JUSTIFY FUNCTION (default width):"
if [ ! "$(util::right_justify right)" == "%80s right" ] ; then
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else 
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

increment_test_counter
printf "» [TEST%+3s/%s]%${WIDTH}s " $count $TOTAL_TESTS "RIGHT JUSTIFY FUNCTION (10 width):"
if [ ! "$(util::right_justify right 10)" == "%10s right" ] ; then
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else 
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

### CENTRE test
#### NOTE: assumes a terminal width of 80? 
increment_test_counter
printf "» [TEST%+3s/%s]%${WIDTH}s " $count $TOTAL_TESTS "CENTRE JUSTIFY FUNCTION:"
if [ ! "$(util::centre_justify centre)" == "%36s centre" ] ; then 
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else 
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

### BOLD test
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "BOLD:"
if [ ! "$(extract "$bold")" == "\E[1m" ] ; then 
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0 

### OVERSTRIKE test
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "OVERSTRIKE:"
if [ ! "$(extract "$bold")" == "\E[1m" ] ; then 
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0 

### REVERSE test
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "REVERSE:"
if [ ! "$(extract "$reverse")" == "\E[7m" ] ; then 
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

echo
echo "-=-= COLOUR TESTS =-=-"
### RED test
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "RED:"
if [ ! "$(extract "$red")" == "\E[31m" ] ; then 
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

### ORANGE test
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "ORANGE:"
if [ ! "$(extract "$orange")" == "\E[38;5;202m" ] ; then 
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

### YELLOW test
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "YELLOW:"
if [ ! "$(extract "$yellow")" == "\E[33m" ] ; then 
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

### GREEN test
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "GREEN:"
if [ ! "$(extract "$green")" == "\E[32m" ] ; then 
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

### CYAN test
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "CYAN:"
if [ ! "$(extract "$cyan")" == "\E[36m" ] ; then 
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

### BLUE test
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "BLUE:"
if [ ! "$(extract "$blue")" == "\E[34m" ] ; then 
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

### MAGENTA test
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "MAGENTA:"
if [ ! "$(extract "$magenta")" == "\E[35m" ] ; then 
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

### WHITE test
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "WHITE:"
if [ ! "$(extract "$white")" == "\E[37m" ] ; then 
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

### NOCOLOUR test
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "NOCOLOUR:"
if ! [ "$(extract "${noColour}")" == "\E(B\E[0m" ] ; then
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else 
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

echo
echo "-=-= FUNCTION TESTS =-=-"

### DEBUG test
increment_test_counter
DEBUG=1
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "DEBUG FUNCTION:"
if ! [ "$(extract $(util::debug ""))" == "\E[34m[DEBUG]\E(B\E[0m" ] ; then
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else 
  echo "$(tput setaf 2)PASSED"
fi
DEBUG=0
tput sgr 0

### PRINT test
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "PRINT FUNCTION:"
if ! [ "$(util::print "Test")"  == "Test" ] ; then 
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else
    echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

### WARN test
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "WARN FUNCTION:"
if ! [ "$(extract "$(util::warn "" 2>&1)")" == "\n\E[33m\E[7m[WARN]\E(B\E[0m  " ] ; then
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else 
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

### ERROR test
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "ERROR FUNCTION:"
if ! [ "$(extract "$(util::error "" 2>&1)")" == "\n\E[31m\E[7m[ERROR]\E(B\E[0m " ] ; then
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else 
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

### PAUSE test
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "PAUSE FUNCTION:"
if ! [ "$(extract "$(echo "z" | util::pause)")" == "\E[32mPress any key to continue...\E(B\E[0m" ] ; then 
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else 
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

### CONFIRM test (Should really test Y,N, and enter)
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "CONFIRM FUNCTION:"
if ! echo | util::confirm "Yes please" 2>/dev/null ; then 
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else 
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

### REQUIREMENTS test
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "REQUIREMENTS FUNCTION:"
if ! util::confirm_requirements ; then
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else 
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

### USAGE test
increment_test_counter
printf "» [TEST%+3s/%s]%+${WIDTH}s " $count $TOTAL_TESTS "USAGE FUNCTION:"
if ! [[ "$(util::usage)" =~ "Usage:" ]] ; then
  echo "$(tput setaf 1)FAILED"
  increment_failed_tests_counter
else 
  echo "$(tput setaf 2)PASSED"
fi
tput sgr 0

echo 

if [ $failed_tests -gt 0 ] ; then 
  echo -E "» "$(tput setaf 1)"${failed_tests}"$(tput sgr 0)" / ${TOTAL_TESTS} tests "$(tput setaf 1)"FAILED!"
  tput sgr 0
  echo "  Please address the issues, then re-run the tests."
  exit 1
else 
  echo "» "$(tput setaf 2)"${count}"$(tput sgr 0)" / ${TOTAL_TESTS} tests "$(tput setaf 2)"PASSED!"
  tput sgr 0
  exit 0
fi

