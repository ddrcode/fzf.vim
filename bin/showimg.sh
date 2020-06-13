#!/bin/sh

FILE=$1

has() {
  command -v $1 > /dev/null
}

show_with_kitty() {
  if (has kitty && has convert && kitty +kitten icat --detect-support --detection-timeout 0.1 2> /dev/null); then 
    kitty +kitten icat --align left --transfer-mode stream  $1
  elif (has viu); then
    viu $1
  fi
}

show_with_kitty $1

