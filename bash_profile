#!/bin/bash

# A convenience script of bash settings
# Phillip Dexheimer (pdexheimer@gmail.com), 2019


# From https://stackoverflow.com/a/246128 - what directory is this file in?
UTILS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd)"

export PATH="$PATH:$UTILS_DIR"

alias tsv2csv="change_delimiter --from $'\t' --to ,"
alias csv2tsv="change_delimiter --from , --to $'\t'"
alias grep="grep --color"
