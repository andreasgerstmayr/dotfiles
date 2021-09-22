#!/bin/bash

echo "$(TZ=America/Los_Angeles date +"SF %H:%M") / $(TZ=America/New_York date +"ET %H:%M") / $(TZ=Australia/Melbourne date +"MEL %H:%M")"
