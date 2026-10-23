#!/bin/bash
OWNER=$(gh api user --jq .login)
COLLAB=${COLLAB:?set COLLAB first}
gh api -X PUT repos/$OWNER/lab6/collaborators/$COLLAB -f permission=push
echo "Pending invites:"
gh api repos/$OWNER/lab6/invitations --jq '.[] | {id, invitee: .invitee.login}'
