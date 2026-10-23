#!/bin/bash
OWNER=$(gh api user --jq .login)
COLLAB=${COLLAB:?}; COLLAB_TOKEN=${COLLAB_TOKEN:?}

INV=$(GH_TOKEN=$COLLAB_TOKEN gh api user/repository_invitations --jq ".[] | select(.repository.name==\"lab6\") | .id")
[ -n "$INV" ] && GH_TOKEN=$COLLAB_TOKEN gh api -X PATCH user/repository_invitations/$INV

echo "Pending invites (should be empty):"
gh api repos/$OWNER/lab6/invitations --jq '.[] | .invitee.login'
gh api repos/$OWNER/lab6/collaborators/$COLLAB --silent && echo "$COLLAB IS a collaborator"
gh api repos/$OWNER/lab6/collaborators/$COLLAB/permission --jq .permission

rm -rf /tmp/collab-test
git clone https://x-access-token:$COLLAB_TOKEN@github.com/$OWNER/lab6.git /tmp/collab-test
cd /tmp/collab-test
git config user.name "$COLLAB"; git config user.email "$COLLAB@users.noreply.github.com"
echo "pushed by collab" > collab.txt
git add collab.txt && git commit -m "collab push test"
git push origin main && echo "COLLAB PUSH SUCCEEDED"
