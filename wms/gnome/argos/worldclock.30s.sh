#!/bin/bash

echo "$(TZ=America/Los_Angeles date +"SF %H:%M") / $(TZ=America/Chicago date +"HU %H:%M") / $(TZ=Australia/Melbourne date +"MEL %H:%M")"
