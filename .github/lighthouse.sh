#!/usr/bin/env bash

# The following file must exist & must define the 
# LIGHTHOUSE, HOST_NAME, MINIMUM_SCORE, and PAGES variables.
# See example.config.sh
source "${BASH_SOURCE[0]%/*}/config.sh"

if [ ! -f $LIGHTHOUSE ];
  then
    echo "WARNING: Lighthouse executable not found. You probably need to run npm install -g lighthouse"
    exit 1
fi

for PAGE in "${PAGES[@]}"; do
  echo "Running accessibility check for $HOST_NAME$PAGE"
  OUTPUT_PATH="${BASH_SOURCE[0]%/*}/lighthouse-report.json"
  $LIGHTHOUSE $HOST_NAME$PAGE --quiet --chrome-flags='--headless' --output=json --output-path $OUTPUT_PATH
  SCORE="$(php ${BASH_SOURCE[0]%/*}/accessibility-score.php)"
  if [ "$SCORE" -lt $MINIMUM_SCORE ];
    then 
      echo "WARNING: The calculated accessibility score for " $HOST_NAME$PAGE " was " $SCORE
      echo "Review the output in accessibility-report.json and fix any errors."
      exit 1
  else
    echo "Passed with a score of " $SCORE
  fi
done

e=$?