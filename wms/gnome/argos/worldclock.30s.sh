#!/bin/bash

echo "$(TZ=UTC date +"UTC %H:%M") /" \
     "$(TZ=America/Los_Angeles date +"SF %H:%M") / " \
     "$(TZ=America/New_York date +"GA %H:%M") / " \
     "$(TZ=Australia/Melbourne date +"MEL %H:%M")"
