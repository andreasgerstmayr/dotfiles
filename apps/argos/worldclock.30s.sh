#!/bin/bash

echo "$(TZ=UTC date +"UTC %H:%M") /" \
     "$(TZ=America/Toronto date +"TO %H:%M") / " \
     "$(TZ=America/Merida date +"ME %H:%M") /" \
     "$(TZ=Asia/Kolkata date +"IN %H:%M")"
