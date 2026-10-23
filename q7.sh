#!/bin/bash
BR=QX00221466
OWNER=$(gh api user --jq .login)
gh pr create -R $OWNER/lab6 --base main --head $BR \
  --title "Add lab answers q1-q5" \
  --body "Merges the q1-q5 scripts from $BR into main."
