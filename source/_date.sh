#!/bin/bash

if [[ "$DATETIME" == "unset" ]] || [[ "$DATETIME" == "" ]]; then
  # generate datetime
  echo Generating datetime using date command
  echo "::set-output name=DATETIME::$(date +'%Y%m%d')$(date +'%H%M')"
else
  # use provided datetime
  echo Using provided datetime $DATETIME
  echo "::set-output name=DATETIME::${DATETIME}"
fi
