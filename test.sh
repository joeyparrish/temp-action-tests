#!/bin/bash

set -x  # Print commands
set +e  # No fail on error

git config user.email foo@bar
git config user.name foo

touch foo
git add foo
git commit -m foo

git push -f origin HEAD:main
git push -f origin HEAD:no-token

touch bar
git add bar
git commit -m bar

export GITHUB_TOKEN=$HOMEBREW_GITHUB_API_TOKEN
gh auth setup-git

git push -f origin HEAD:main
git push -f origin HEAD:no-token-2

exit 0
