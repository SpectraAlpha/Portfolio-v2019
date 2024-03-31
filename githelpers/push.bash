msg=$1

git add .
git commit -m $msg

# Add the original repository as a remote (assuming 'upstream' is already added)
git remote add upstream https://github.com/SpectraAlpha/Portfolio-v2019.git

# Fetch the latest changes from the original repository
git fetch upstream

# Merge the changes from the original repository into your local branch
git merge upstream/main

# Push the merged changes to your fork on GitHub
git push origin main