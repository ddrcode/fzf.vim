#!/bin/sh

FILE=$1

show_with_kitty() {
  if (kitty +kitten icat --detect-support --detection-timeout 0.1 2> /dev/null); then echo "koza";
  fi
  kitty +kitten icat --align left --transfer-mode stream  $1
}

show_with_kitty $1

