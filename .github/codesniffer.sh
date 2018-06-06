#!/usr/bin/env bash

# The following file must exist & must define the 
# PHPCS_BIN and RULESET variables.
# See example.config.sh
source "${BASH_SOURCE[0]%/*}/config.sh"

PHP_LIST=$( git diff --name-only --cached --diff-filter=ACM -- '*.php' '*.inc' '*.yml' '*.module' '*.install')

if [ ! -f $PHPCS_BIN ];
  then
    echo "WARNING: PHP Code Sniffer was not found. This commit might include coding standards violations. You can fix this by ensuring that composer has correctly installed it's dev dependencies including a symlink in the bin folder to the phpcs package in vendor."
    exit 1
  else
    echo "Sniffing staged files via PHP Code Sniffer."
    echo "To bypass this check, add '--no-verify' to your commit command"
fi

if [ ! -z "$PHP_LIST" ];
  then
    $PHPCS_BIN --standard=$RULESET ${PHP_LIST}
fi
