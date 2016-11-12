#!/bin/sh

# Purpose:
# Change author name and/or email and rewrite git history
#
# This script was taken from:
# https://help.github.com/articles/changing-author-info/



git filter-branch --env-filter '

OLD_EMAIL="jukey@ju-key.de"
CORRECT_NAME="Uwe Kaminski"
CORRECT_EMAIL="git@ju-key.de"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
