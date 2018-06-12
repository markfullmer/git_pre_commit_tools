# The path to the phpcs executable.
PHPCS_BIN=~/.composer/vendor/bin/phpcs
# The path to the Drupal PHPCS ruleset.
RULESET=~/.composer/vendor/drupal/coder/coder_sniffer/Drupal/ruleset.xml

# The path to the phpcs executable
# If on a *Nix machine using node, you can install this globally with
# To install lighthouse, run "npm install -g stylelint"
STYLELINTER=/usr/local/bin/stylelint

# The absolute path to the Lighthouse executable. If globally installed, you can simply use "lighthouse"
# It may also be installed locally (e.g., /DOCROOT/node_modules/.bin/lighthouse)
# To install lighthouse, run "npm install -g lighthouse"
LIGHTHOUSE="/usr/local/bin/lighthouse"
# The baseline allowed accessibility score
MINIMUM_SCORE=100
# HOST_NAME is used to run automated accessibility tests. It should match your local environment
HOST_NAME="http://mysite.test"
# A bash-style array of URL paths, relative to the HOST_NAME, that should be checked for accessibility.
declare -a PAGES=(/ /user)