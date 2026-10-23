#!/bin/bash
BR=QX00221466
OWNER=$(gh api user --jq .login)
gh pr merge $BR -R $OWNER/lab6 --merge
gh pr view $BR -R $OWNER/lab6 --json state,mergedAt
