#!/bin/sh
# shellcheck disable=SC2034,SC2039

# Run a prewritten script live for demos, wih gaps for questions and observation
#
# For each line, we print the cmd, wait, run cmd, wait
# Wait = wait for some time or wait for Enter key (other input will be ignored)

LIVE=T

wait (){
   if [ $LIVE = "T" ]; then
     read -s -r next >/dev/null
   else
     sleep 2
   fi
}

while read -r -u3 LINE; do
  if [ -n "$LINE" ]; then
    echo "$ $LINE"
    sh -c "$LINE"
    wait
  fi
done 3< input

