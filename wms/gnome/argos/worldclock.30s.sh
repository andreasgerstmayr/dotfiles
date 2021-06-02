#!/bin/bash

echo "$(TZ=America/Los_Angeles date +"SF %H:%M") / $(TZ=America/Chicago date +"AL %H:%M") / $(TZ=Australia/Melbourne date +"MEL %H:%M")"
