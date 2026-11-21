#!/bin/bash
# Setup for git repo.
# Run this script before making any commits.

# configure this repository for use with github
config-repo.sh github.com

# configure .githooks as the git hooks directory
git config core.hooksPath .githooks
