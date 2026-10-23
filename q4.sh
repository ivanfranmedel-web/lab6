#!/bin/bash
OWNER=$(gh api user --jq .login)
COLLAB=${COLLAB:?}; COLLAB_TOKEN=${COLLAB_TOKEN:?}

gh api -X DELETE repos/$OWNER/lab6/collaborators/$COLLAB && echo "Removed $COLLAB"
gh api repos/$OWNER/lab6/collaborators/$COLLAB --silent 2>&1 || echo "Confirmed: $COLLAB is no longer a collaborator"

cd /tmp/collab-test
echo "second attempt" >> collab.txt
git add collab.txt && git commit -m "collab push after removal"
git push origin main && echo "UNEXPECTED: push worked" || echo "Push rejected, as expected"
