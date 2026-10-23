#!/bin/bash
OWNER=$(gh api user --jq .login)
gh issue create -R $OWNER/lab6 \
  --title "create helloworld echo file" \
  --body "echo hello Pearse from lab6" \
  --assignee "@me" \
  --label enhancement
