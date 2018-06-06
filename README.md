<img src="https://raw.githubusercontent.com/markfullmer/git_pre_commit_tools/master/pre-commit-tools-screenshot.png"  alt="Screenshot of command line pre-commit checking" />

# Git `pre-commit` Tools
This is for you if:
- You manage code using Git, and use Github issues or pull requests
- You care about your code meeting syntax standards
- You care about your web application meeting accessibility standards

## What's included?

### 1. An opinionated [template for new Github issues](https://github.com/markfullmer/git_pre_commit_tools/blob/master/.github/ISSUE_TEMPLATE.md). 
If you're tired of people leaving out "Steps to Reproduce" when submitting bug reports or "Expected/desired behavior" for feature requests, this is for you.

### 2. An opinionated [template for new Github pull requests](https://github.com/markfullmer/git_pre_commit_tools/blob/master/.github/PULL_REQUEST_TEMPLATE.md). 
If you're tired of contributors leaving out implementation notes, testing steps, or code standards vouches in their pull requests, this is for you. 

### 3. An *awesome* `pre-commit` script
The `git` software allows for various [hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) to be running before and after standard `git` commands. One of the most useful of these is to run something before a `git commit` command executes. 
For example, you don't want to commit code unless it:

- meets a given framework's syntax ruleset
- complies with standard CSS syntax
- meets web accessibility standards

## Setup & configuration
This repository's `.github` directory can be copied, as-is, into the document root of your own `git`-hosted project.

### Templates
The presence of `ISSUE_TEMPLATE.md` and `PULL_REQUEST_TEMPLATE.md` in the `.github` directory will automatically trigger new issues & pull requests to be pre-populated with the template.

### Pre-commit hooks
You now have a `pre-commit` file in your `.github/` directory. It is pre-configured to run 3 checks: PHP code syntax (using [PHP_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer)), CSS syntax (using [stylelint](https://github.com/stylelint/stylelint)), and accessibility checking (using [lighthouse](https://github.com/GoogleChrome/lighthouse)). 

For the `pre-commit` hooks, a little setup is involved.

1. Allow your custom pre-commit hook to be executable:
```
chmod +x .github/pre-commit
``` 
2. Tell your repository to look in `.github/` for hooks:
```
git config core.hooksPath .github/
```
3. Add application-specific configuration:
```
cp .github/example.config.sh .github/config.sh
```
(At this point, your individual setup will diverge, but the notes in the [example.config.sh](https://github.com/markfullmer/git_pre_commit_tools/blob/master/.github/example.config.sh) file should provide a general starting point.)

To get up and running with CSS and accessibility checking, you'll need to have `npm` installed, and install two packages globally:

`npm install -g stylelint`

`npm install -g lighthouse`

For PHP projects, follow the instructions for installing [PHP Codesniffer](https://github.com/squizlabs/PHP_CodeSniffer#installation).

If you want to use one/some of the checks, or add your own, add or remove them in the [pre-commit](https://github.com/markfullmer/git_pre_commit_tools/blob/master/.github/pre-commit) file.

## Usage
Easy-peasy. Run `git commit` commands as you would normally. The pre-commit checks will execute automatically, and you'll get output along the lines of:

```bash
git commit -m "Update pre-commit checks" -a

Running pre-commit checks...
To bypass this check, add '--no-verify' to your commit command

Sniffing staged files via PHP Code Sniffer...

Linting staged files via Stylelint...

Running accessibility check for http://mysite.test/
Passed with a score of  100
Running accessibility check for http://mysite.test/search/projects
Passed with a score of  90
Running accessibility check for http://mysite.test/search/faculty
Passed with a score of  90
Running accessibility check for http://mysite.test/user
Passed with a score of  98
```