#!/bin/sh

export OLD_EMAIL="nkane@novetta.com"
export CORRECT_EMAIL="nkanedev@gmail.com"
export CORRECT_NAME="Nick Kane"

git filter-branch --env-filter '
OLD_EMAIL="nkane@novetta.com"
CORRECT_NAME="Nick Kane"
CORRECT_EMAIL="nkanedev@gmail.com"
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
