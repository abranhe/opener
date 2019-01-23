#!/bin/sh
#!/bin/bash

typeset -i tests=0

function describe {
  let tests+=1
  description="$1"
}

function assert {
  if [[ "$1" == "$2" ]]; then
    printf "\033[32m.\033[0m"
  else
    printf "\033[31m\nFAIL: $description\033[0m: '$1' != '$2'\n"
    exit 1
  fi
}

describe "Help"
  ./opener --help > /dev/null 2>&1
  assert $? 0

describe "Help: short flag"
  ./opener -h > /dev/null 2>&1
  assert $? 0

describe "Version"
  ./opener --version > /dev/null 2>&1
  assert $? 0

describe "Version: short flag"
  ./opener -v > /dev/null 2>&1
  assert $? 0

describe "No arguments"
  ./opener > /dev/null 2>&1
  assert $? 1

describe "One argument"
  ./opener foo> /dev/null 2>&1
  assert $? 0

describe "More than one argument"
  ./opener foo bar> /dev/null 2>&1
  assert $? 1

printf "\033[32m\n(✓) Passed $tests assertions without errors\033[0m\n"

exit 0
