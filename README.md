# UPDATE FROM FORK

# Add the remote, call it "upstream":

git remote add upstream git@github.com:jkwill87/mnamer.git

# Fetch all the branches of that remote into remote-tracking branches

git fetch upstream

# Make sure that you're on your main branch:

git checkout main

# Rewrite your main branch so that any commits of yours that
# aren't already in upstream/main are replayed on top of that
# other branch:

git rebase upstream/main
