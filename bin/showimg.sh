#!/bin/sh

FILE=$1


show_with_kitty() {
  has() { command -v $1 > /dev/null; }
  w3mimg="/usr/lib/w3m/w3mimgdisplay"
  
  if (has kitty && has convert && kitty +kitten icat --detect-support --detection-timeout 0.1 2> /dev/null); then 
    kitty +kitten icat --align left --transfer-mode stream  $1
  # elif (has fim); then
  #   fim -a $1
  elif [[ $TERM == *"rxvt" && -f "$w3mimg" ]]; then
    echo -e '0;1;0;0;200;160;;;;;ant.jpg\n4;\n3;' | eval $w3mimg
  elif (has viu); then
    viu $1
  fi
}

show_with_kitty $1

