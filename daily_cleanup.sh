#!/bin/bash
rm -f commits/*.txt || true

username=$(git config user.name)
email=$(git config user.email)

git add commits/
git commit -m "Daily cleanup at $(date '+%Y-%m-%d %H:%M:%S')" || echo "Nothing to clean"
git push
