#!/usr/bin/env bash
echo
if [ ! -f $STYLELINTER ];
  then
    echo "WARNING: Stylelint was not found. This commit might include coding standards violations. You can fix this by running `npm install` in the repository root."
    exit 1
  else
    echo "Linting staged files via Stylelint..."
fi
echo
CSS_LIST=$( git diff --name-only --cached --diff-filter=ACM -- '*.css' '*.scss')
if [ ! -z "$CSS_LIST" ];
  then
    $STYLELINTER ${CSS_LIST}
fi

if [[ $? -ne 0 ]] ; then
    exit 1
fi